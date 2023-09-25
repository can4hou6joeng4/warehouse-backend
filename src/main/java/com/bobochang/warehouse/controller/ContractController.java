package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @author bobochang
 * @Description
 * @Date 2023/9/19 - 11:11
 */
@RequestMapping("/contract")
@RestController
public class ContractController {

    @Autowired
    private ContractService contractService;

    @GetMapping("/contract-list")
    public Result findAllContract() {
        return Result.ok(contractService.queryContractPage());
    }

    @PostMapping("/addContract")
    public Result addContract(@RequestBody Contract contract) {
        return contractService.saveContract(contract);
    }

    @PutMapping("/updateState")
    public Result updateContractState(@RequestBody Contract contract) {
        contract.setUpdateTime(new Date());
        return contractService.updateContractState(contract);
    }

    @PutMapping("/updateContract")
    public Result updateContract(@RequestBody Contract contract) {
        contract.setUpdateTime(new Date());
        return contractService.updateContractName(contract);
    }
}
