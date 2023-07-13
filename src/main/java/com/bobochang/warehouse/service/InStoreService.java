package com.bobochang.warehouse.service;


import com.bobochang.warehouse.entity.InStore;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;

public interface InStoreService {

    //添加入库单的业务方法
    public Result saveInStore(InStore inStore, Integer buyId);

    //分页查询入库单的业务方法
    public Page queryInStorePage(Page page, InStore inStore);

    //确定入库的业务方法
    public Result confirmInStore(InStore inStore);
}
