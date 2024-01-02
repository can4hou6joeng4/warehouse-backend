package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.service.FileService;
import com.lowagie.text.pdf.PdfReader;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import okhttp3.*;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Objects;

/**
 * @author LI
 * @date 2023/12/26
 */
@Service
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class FileServiceImpl implements FileService {
    @Value("${file.pdf2table-API-KEY}")
    public String API_KEY;
    @Value("${file.pdf2table-SECRET-KEY}")
    public String SECRET_KEY;

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();
    
    @Override
    public void pdf2Image(String targetPdf, String targetImage) {
        /* dpi越大转换后越清晰，相对转换速度越慢 */
        int dpi = 350;
        File file = new File(targetPdf);
        PDDocument pdDocument; // 创建PDF文档
        try {
            String imgPDFPath = file.getParent();
            int dot = file.getName().lastIndexOf('.');
            String imagePDFName = file.getName().substring(0, dot); // 获取图片文件名
            String imgFolderPath = null;
            if (targetImage.equals("")) {
                imgFolderPath = imgPDFPath + File.separator;// 获取图片存放的文件夹路径
            } else {
                imgFolderPath = targetImage + File.separator;
            }
            if (createDirectory(imgFolderPath)) {
                pdDocument = PDDocument.load(file);
                PDFRenderer renderer = new PDFRenderer(pdDocument);
                PdfReader reader = new PdfReader(targetPdf);
                int pages = reader.getNumberOfPages();
                StringBuffer imgFilePath = null;
                BufferedImage[] bufferedImages = new BufferedImage[pages];
                for (int i = 0; i < pages; i++) {
                    String imgFilePathPrefix = imgFolderPath + File.separator;
                    imgFilePath = new StringBuffer();
                    imgFilePath.append(imgFilePathPrefix);
                    imgFilePath.append(imagePDFName);
                    imgFilePath.append("_");
                    imgFilePath.append(i + 1);
                    imgFilePath.append(".png");
                    File dstFile = new File(imgFilePath.toString());
                    BufferedImage image = renderer.renderImageWithDPI(i, dpi);
                    bufferedImages[i] = image;
                    ImageIO.write(image, "png", dstFile);
                }
                pdDocument.close();
            } else {
                System.out.println("PDF文档转PNG图片失败：" + "创建" + imgFolderPath + "失败");
            }
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    @Override
    public String getTable(File targetImageFolder) throws IOException {
        String res = "";
        // 遍历文件夹中的所有文件和文件夹
        if (targetImageFolder.exists() && targetImageFolder.isDirectory()) {
            File[] files = targetImageFolder.listFiles();
            if (files != null) {
                for (File file : files) {
                    System.out.println(file.getAbsolutePath());
                    String list = getContent(file.getAbsolutePath(),"table");
                    if (!Objects.equals(list, "")){
                        res = list;
                        break;
                    }
                }
            }
            return res;
        } else {
            return "";
        }
    }

    private final Tesseract tesseract;

    @Override
    public String recognizeText(String path) throws IOException, TesseractException {
        File imageFile = new File(path);
        FileInputStream fileInputStream = new FileInputStream(imageFile);
        byte[] buffer = new byte[(int) imageFile.length()];
        fileInputStream.read(buffer);
        // 转换
        InputStream sbs = new ByteArrayInputStream(buffer);
        BufferedImage bufferedImage = ImageIO.read(sbs);
        tesseract.setOcrEngineMode(0);
        // 对图片进行文字识别
        return tesseract.doOCR(bufferedImage);    }

    @Override
    public String getText(File targetImageFolder) throws IOException {
        String res = "";
        // 遍历文件夹中的所有文件和文件夹
        if (targetImageFolder.exists() && targetImageFolder.isDirectory()) {
            File[] files = targetImageFolder.listFiles();
            if (files != null) {
                for (File file : files) {
                    String list = getContent(file.getAbsolutePath(),"general_basic");
                    if (!Objects.equals(list, "")){
                        res = list;
                        break;
                    }
                }
            }
            return res;
        } else {
            return "";
        }    
    }

    @Override
    public String getFileContent(File targetImageFolder, String requestName) throws IOException {
        String res = "";
        // 遍历文件夹中的所有文件和文件夹
        if (targetImageFolder.exists() && targetImageFolder.isDirectory()) {
            File[] files = targetImageFolder.listFiles();
            if (files != null) {
                for (File file : files) {
                    String list = getContent(file.getAbsolutePath(),requestName);
                    if (!Objects.equals(list, "")){
                        res = list;
                        break;
                    }
                }
            }
            return res;
        } else {
            return "";
        }        }

    private String getContent(String path, String requestName) throws IOException {
        String i = getFileContentAsBase64(path, true);
        HttpURLConnection connection = getHttpURLConnection(i,requestName);

        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            StringBuilder response = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
            JSONObject jsonObject = new JSONObject(response.toString());
            System.out.println(jsonObject);
            
            connection.disconnect();
            
            if (jsonObject.has("tables_result")){
                return jsonObject.get("tables_result").toString();
            } else if (jsonObject.has("words_result")) {
                return jsonObject.get("words_result").toString();
            } else{
                return "";
            }   
        }
    }

    @NotNull
    private HttpURLConnection getHttpURLConnection(String i, String requestName) throws IOException {
        String requestBody = "image=" + i + "&cell_contents=false&return_excel=false";

        URL url = new URL("https://aip.baidubce.com/rest/2.0/ocr/v1/"+requestName+"?access_token=" + getAccessToken());
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        connection.setRequestProperty("Accept", "application/json");
        connection.setDoOutput(true);

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = requestBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }
        return connection;
    }

    private static boolean createDirectory(String folder) {
        File dir = new File(folder);
        if (dir.exists()) {
            return true;
        } else {
            return dir.mkdirs();
        }
    }

    /**
     * 从用户的AK，SK生成鉴权签名（Access Token）
     *
     * @return 鉴权签名（Access Token）
     * @throws IOException IO异常
     */
    String getAccessToken() throws IOException {
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials&client_id=" + API_KEY
                + "&client_secret=" + SECRET_KEY);
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/oauth/2.0/token")
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        String accessToken = new JSONObject(response.body().string()).getString("access_token");
        return accessToken;
    }

    /**
     * 获取文件base64编码
     *
     * @param path 文件路径
     * @param urlEncode 如果Content-Type是application/x-www-form-urlencoded时,传true
     * @return base64编码信息，不带文件头
     * @throws IOException IO异常
     */
    static String getFileContentAsBase64(String path, boolean urlEncode) throws IOException {
        byte[] b = Files.readAllBytes(Paths.get(path));
        String base64 = Base64.getEncoder().encodeToString(b);
        if (urlEncode) {
            base64 = URLEncoder.encode(base64, "utf-8");
        }
        return base64;
    }

}
