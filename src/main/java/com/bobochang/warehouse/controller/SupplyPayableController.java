//package com.bobochang.warehouse.controller;
//
//import com.bobochang.warehouse.entity.Result;
//import com.bobochang.warehouse.entity.Supply;
//import com.bobochang.warehouse.entity.SupplyPayable;
//import com.bobochang.warehouse.page.Page;
//import com.bobochang.warehouse.service.SupplyPayableService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * @author LI
// * @date 2023/10/24
// */
//@RestController
//@RequestMapping("/supply")
//public class SupplyPayableController {
//    @Autowired
//    private SupplyPayableService supplyPayableService;
//    
//    @RequestMapping("/supply-page-list")
//    public Result storePageList(Page page, Supply supply) {
//        System.out.println(supply.getSupplyName());
//        //执行业务
//        page = supplyPayableService.querySupplyPage(page, supply);
//        //响应
//        return Result.ok(page);
//    }
//}
