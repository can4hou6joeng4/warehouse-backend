package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.ActivitiService;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * @author LI
 * @date 2023/10/9
 */
@Service
public class ActivitiServiceImpl implements ActivitiService {
    @Override
    public Result xmlUpload(String file,String fileName) {
        if (file.isEmpty()) {
            return Result.err(500,"上传文件失败！");
        }

        try {
            // Get the file bytes and save to the specified directory
            byte[] fileBytes = file.getBytes();
            String filePath = "src/main/resources/processes/"+fileName+".xml";

            Files.write(Path.of(filePath), fileBytes);

            // Process the XML file (optional)
            // You can parse the XML, save it to a database, etc.

            return Result.ok("保存流程成功！");
        } catch (IOException e) {
            return Result.err(500,"保存xml文件失败！");
        }
    }
}
