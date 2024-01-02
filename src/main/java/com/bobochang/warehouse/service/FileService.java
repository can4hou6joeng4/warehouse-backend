package com.bobochang.warehouse.service;

import net.sourceforge.tess4j.TesseractException;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public interface FileService {
    void pdf2Image(String targetPdf, String targetImage);

    String getTable(File targetImageFolder) throws IOException;

    String recognizeText(String path) throws IOException, TesseractException;
    
    String getText(File targetImageFolder) throws IOException;
    
    String getFileContent(File targetImageFolder, String requestName) throws IOException;
}
