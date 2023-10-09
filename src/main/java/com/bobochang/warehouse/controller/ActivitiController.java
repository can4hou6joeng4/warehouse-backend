package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.ActivitiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * @author LI
 * @date 2023/10/9
 * 工作流
 */
@RestController
@RequestMapping("/activati")
@Slf4j
public class ActivitiController {
    @Autowired
    private ActivitiService activitiService;

    @PostMapping("/xml-upload")
    public Result xmlUpload(@RequestParam("file") String file,@RequestParam("fileName") String fileName){
        return activitiService.xmlUpload(file,fileName);
    }

}
