package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.entity.Salary;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.page.PageCheckinDto;
import com.bobochang.warehouse.service.SalaryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

/**
 * @author LI
 * @date 2023/12/11
 */
@RestController
@Slf4j
@RequestMapping("/salary")
public class SalaryController {
    @Autowired
    private SalaryService salaryService;
    
    @GetMapping("/salary-list")
    public Result findSalaryList(PageCheckinDto page, Salary salary) {
        System.out.println(salary);
        page = salaryService.querySalaryPage(page, salary);
        return Result.ok(page);
    }

    /**
     * 
     * @return
     */
    @PostMapping("/salary-add")
    public Result addSalaryOnMonth(@RequestBody PageCheckinDto page) throws ParseException {
        salaryService.addSalaryOnMonth(page);
        return Result.ok("生成成功");
    }

    @PostMapping("/salary-update")
    public Result updateSalaryById(@RequestBody Salary salary){
       int bool = salaryService.updateSalaryById(salary);
        if(bool >0){
            return Result.ok("修改成功");
        }else{
            return Result.err(500,"修改失败");
        }
    }
}
