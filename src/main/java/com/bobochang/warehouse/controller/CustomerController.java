package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.entity.Customer;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author LI
 * @date 2023/11/21
 */
@RequestMapping("/customer")
@RestController
@Transactional
@BusLog(name = "客户管理")
@Slf4j
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    /**
     * 查询所有的客户记录
     * @return
     */
    @GetMapping("/customer-list")
    public Result getAll(){
        List<Customer> customerList = customerService.getAll();
        return Result.ok(customerList);
    }
}
