package com.bobochang.warehouse;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.bobochang.warehouse.entity.CurrentUser;
import com.bobochang.warehouse.service.CheckinService;
import com.bobochang.warehouse.service.UserService;
import com.bobochang.warehouse.utils.DigestUtil;
import org.apache.el.parser.Token;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Currency;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SpringBootTest
class WarehouseBackendApplicationTests {

    @Test
    void contextLoads() {
        List<String> urlList = new ArrayList<>();
        urlList.add("/contract/download-image/.*");

        if (urlList.contains("/contract/download-image/t01.jpg")) {
            System.out.println('t');
        } else {
            System.out.println('f');
        }


        String targetUrl = "/contract/download-image/t01.jpg";

        Pattern pattern = Pattern.compile(urlList.get(0));
        Matcher matcher = pattern.matcher(targetUrl);
        Matcher matcher1 = Pattern.compile("/contract/download-image/.*").matcher(targetUrl);
        if (Pattern.compile("/contract/download-image/.*").matcher(targetUrl).matches()) {
            System.out.println('t');
        } else {
            System.out.println('f');
        }
    }

    @Autowired
    private UserService userService;

    @Autowired
    private CheckinService checkinService;

    @Test
    void test() {
        LocalDate currentDate = LocalDate.now();
        LocalDate monthStartDate = currentDate.with(TemporalAdjusters.firstDayOfMonth());
        LocalDate monthEndDate = currentDate.with(TemporalAdjusters.lastDayOfMonth());
        System.out.println(monthEndDate);
        System.out.println(monthStartDate);

        // 查询用户的入职日期，如果是开始时间早于入职日期之间则返回错误的数据
        // 并且把开始时间调整到入职日期

        // 获取到开始日期和结束日期就采用查询当周考勤情况的方法
        // 当周考勤情况的方法也是可以查询一段时间内考勤情况的方法
        HashMap param=new HashMap();
        param.put("userId",1);
        param.put("startDate",monthStartDate.toString());
        param.put("endDate",monthEndDate.toString());
        ArrayList<HashMap> list=checkinService.searchMonthCheckin(param);
        System.out.println(list);
    }
}
