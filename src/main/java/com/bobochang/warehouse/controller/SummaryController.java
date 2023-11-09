package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.OutStore;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ActivitiService;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.service.InStoreService;
import com.bobochang.warehouse.service.OutStoreService;
import com.bobochang.warehouse.utils.TokenUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author LI
 * @date 2023/11/9
 */
@RequestMapping("/summary")
@RestController
@Slf4j
public class SummaryController {
    @Autowired
    private TokenUtils tokenUtils;
    
    @Autowired
    private ContractService contractService;
    
    @Autowired
    private ActivitiService activitiService;
    
    @Autowired
    private OutStoreService outStoreService;
    
    @Autowired
    private InStoreService inStoreService;
    /**
     * 完成结算任务
     * @param token 用户令牌 contract 包含合同id
     * @return
     */
    @PostMapping("/complete-task")
    public Result completeTask(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token,
                               @RequestBody Flow flow){
        System.out.println(flow.getContractId());
        String userCode = tokenUtils.getCurrentUser(token).getUserCode();

        Contract contract = new Contract();
        contract.setContractId(flow.getContractId());
        contract.setContractState("4"); // 将合同状态修改为结算中

        if(contractService.updateContractState(contract) < 1){
            return Result.err(500,"修改合同状态失败");
        }

        return activitiService.completeTask(userCode, flow);
    }

    /**
     * 导出采购列表信息数据
     * @param page
     * @param outStore 包含合同id
     * @return
     */
    @RequestMapping("/export-table")
    public Result exportTable(Page page, OutStore outStore) {
        //分页查询仓库
        page = outStoreService.outStoreSummaryPage(page, outStore);

        //拿到当前页数据
        List<?> resultList = page.getResultList();
        //响应
        return Result.ok(resultList);
    }
}
