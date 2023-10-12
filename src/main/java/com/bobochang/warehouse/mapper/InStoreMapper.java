package com.bobochang.warehouse.mapper;


import com.bobochang.warehouse.entity.InStore;
import com.bobochang.warehouse.page.Page;

import java.util.List;

public interface InStoreMapper {

    //添加入库单的方法
    public int insertInStore(InStore inStore);

    //查询入库单总行数的方法
    public int selectInStoreCount(InStore inStore);

    //分页查询入库单的方法
    public List<InStore> selectInStorePage(Page page, InStore inStore);

    //根据id将入库单状态改为已入库的方法
    public int updateIsInById(Integer insId);
}