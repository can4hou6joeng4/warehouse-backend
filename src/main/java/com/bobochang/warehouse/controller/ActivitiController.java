package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.ActivitiService;
import com.bobochang.warehouse.service.FlowService;
import com.bobochang.warehouse.service.UserInfoService;
import com.bobochang.warehouse.utils.TokenUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author LI
 * @date 2023/10/9
 * 工作流
 */
@RestController
@RequestMapping("/activiti")
@Slf4j
public class ActivitiController {
    @Autowired
    private ActivitiService activitiService;

    @Autowired
    private FlowService flowService;

    @Autowired
    private TokenUtils tokenUtils;

    @Autowired
    private UserInfoService userService;


    /**
     * 上传工作流的xml文件
     * @param file
     * @param fileName
     * @return
     */
//    @PostMapping("/xml-upload")
//    public Result xmlUpload(@RequestParam("file") String file,@RequestParam("fileName") String fileName){
//        String filePath = activitiService.xmlUpload(file, fileName);
//        if(!Objects.equals(filePath, "")){
//            // 部署流程以及保存流程
//            Flow flow = new Flow();
//            flow.setFlowName(fileName);
//            flow.setFilePath(filePath);
//
//            return flowService.deployFlow(flow);
//        }else {
//            return Result.err(500,"流程文件保存失败！");
//        }
//    }

    /**
     * 开启流程实例
     * @param contract 里面包括 contractId 合同id state 是否需要采购
     * @return
     */
    @PostMapping("/start-instance")
    public Result startInstance(@RequestBody Contract contract){
        return activitiService.startInstance(contract);
    }

    /**
     * 查看当前用户是否有要处理的任务
     * @param token
     * @return
     */
    @GetMapping("/have-task")
    public Result haveTask(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token){
        return activitiService.haveTask(tokenUtils.getCurrentUser(token).getUserId());
    }

    /**
     * 分页查看流程实例
     * @param token
     * @return
     */
    @GetMapping("/activiti-page-list")
    public Result activitiPageList(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token){
        // 根据token获得用户的角色
        String roleCode = userService.searchRoleCodeById(tokenUtils.getCurrentUser(token).getUserId());
        log.info(roleCode);
        return Result.ok(activitiService.searchTask(roleCode));
    }

    /**
     * 完成任务，主要是超级管理员
     * @param token 用户令牌 contract 包含合同id
     * @return
     */
    @PostMapping("/complete-task")
    public Result completeTask(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                               @RequestBody Flow flow){
        System.out.println(flow.getContractId());
        String userCode = tokenUtils.getCurrentUser(token).getUserCode();
        
        return activitiService.completeTask(userCode, flow);
    }
    
    @PostMapping("/skip-task")
    public Result skipTask(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                           @RequestBody Contract contract) throws Exception {
        String userCode = tokenUtils.getCurrentUser(token).getUserCode();
        return activitiService.skipTask(userCode, contract);
    }
}
