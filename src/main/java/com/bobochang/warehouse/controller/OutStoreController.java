package com.bobochang.warehouse.controller;


import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.*;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.OutStoreService;
import com.bobochang.warehouse.service.StoreService;
import com.bobochang.warehouse.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/outstore")
@RestController
@BusLog(name = "出库管理")
public class OutStoreController {

    //注入OutStoreService
    @Autowired
    private OutStoreService outStoreService;

    //注入TokenUtils
    @Autowired
    private TokenUtils tokenUtils;

    //注入StoreService
    @Autowired
    private StoreService storeService;

//    @Autowired
//    private ActivitiService activitiService;

//    /**
//     * 添加出库单的url接口/outstore/outstore-add
//     *
//     * @RequestBody OutStore outStore将添加的出库单信息的json数据封装到参数OutStore对象;
//     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token
//     * 将请求头Token的值即客户端归还的token赋值给参数变量token;
//     */
//    @RequestMapping("/outstore-add")
//    @Transactional
//    @BusLog(descrip = "添加出库单")
//    public Result addOutStore(@RequestBody OutStore outStore,
//                              @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token) {
//
//        //获取当前登录的用户
//        CurrentUser currentUser = tokenUtils.getCurrentUser(token);
//        //获取当前登录的用户id,即添加出库单的用户id
//        int createBy = currentUser.getUserId();
//        outStore.setCreateBy(createBy);
//
//        //执行业务
//        Result result = outStoreService.saveOutStore(outStore);
//
//        //响应
//        return result;
//    }
//
//    /**
//     * 查询所有仓库的url接口/outstore/store-list
//     */
//    @RequestMapping("/store-list")
//    public Result storeList() {
//        //执行业务
//        List<Store> storeList = storeService.queryAllStore();
//        //响应
//        return Result.ok(storeList);
//    }

    /**
     * 分页查询出库单的url接口/outstore/outstore-page-list
     * <p>
     * 参数Page对象用于接收请求参数页码pageNum、每页行数pageSize;
     * 参数OutStore对象用于接收请求参数仓库id storeId、商品名称productName、
     * 是否出库isOut、起止时间startTime和endTime;
     * <p>
     * 返回值Result对象向客户端响应组装了所有分页信息的Page对象;
     */
    @RequestMapping("/outstore-page-list")
    public Result outStorePageList(Page page, OutStore outStore) {
        //执行业务
        page = outStoreService.outStorePage(page, outStore);
        //响应
        return Result.ok(page);
    }

//    /**
//     * 确定出库的url接口/outstore/outstore-confirm
//     */
//    @RequestMapping("/outstore-confirm")
//    @Transactional
//    @BusLog(descrip = "出库单确认")
//    public Result confirmOutStore(@RequestBody OutStore outStore, @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token) {
//        //执行业务
//        Result result = outStoreService.confirmOutStore(outStore);
//
//        Flow flow = new Flow();
//        flow.setOutStoreId(outStore.getOutsId());
//        String userCode = tokenUtils.getCurrentUser(token).getUserCode();
//        activitiService.completeTask(userCode, flow);
//
////        activitiService.completeTask(outStore.getUserCode(), flow);
//        //响应
//        return result;
//    }
}
