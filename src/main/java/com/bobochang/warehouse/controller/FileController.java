package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.FileService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.time.Instant;
import java.util.*;


/**
 * @author LI
 * @date 2023/12/20
 */
@Slf4j
@RequestMapping("/file")
@RestController
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class FileController {

    @Value("${file.upload-path}")
    private String uploadPath;
    
    @Autowired
    private FileService fileService;

    @CrossOrigin
    @PostMapping("/upload-contract-annex")
    @BusLog(descrip = "上传合同文件")
    public Result uploadImg(MultipartFile file) {
        try {
            //拿到图片保存到的磁盘路径
            long timestamp = Instant.now().toEpochMilli(); // 拿到当前时间戳作为图片保存的名称
            String flag = UUID.randomUUID().toString().substring(0,5); // 唯一标识符，防止毫秒间调用产生的相同时间戳
            String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf('.'));
            // pdf文件保存
            String targetPdf = uploadPath + "/" + fileName + "-" + flag + ".pdf";
            File targetFile = new File(targetPdf);

            // 如果文件已存在，先删除旧文件
            if (targetFile.exists()) {
                targetFile.delete();
            }
            // 保存合同附件（如果文件不存在或者已删除，则进行保存）
            file.transferTo(targetFile);

            // 创建图片合同切成图片后存放的文件夹以及保存路径
            String targetImage = uploadPath + "/"+ fileName  + "-" + flag + "/";
            File targetImageFolder = new File(uploadPath + "/"+ fileName + "-" + flag);
            if (!targetImageFolder.exists()) {
                targetImageFolder.mkdirs();
            }
            
            // 合同pdf附件转为图片文件
            fileService.pdf2Image(targetPdf,targetImage);

            Map<String,Object> map = new HashMap<>();
            
            // 根据文件图片识别出表格数据
            String tableList = fileService.getFileContent(targetImageFolder,"table");
            map.put("tableList",tableList);
            System.out.println(tableList);
            
            // 根据文件图片识别出合同数据
            String baseList = fileService.getFileContent(targetImageFolder,"general_basic");
            map.put("textList", baseList);
            System.out.println(baseList);
            
            //成功响应
            map.put("path",timestamp + "-" + flag + ".pdf");
            return Result.ok(map);
        } catch (IOException e) {
            //失败响应
            return Result.err(Result.CODE_ERR_BUSINESS, "图片上传失败！");
        }
    }
}
