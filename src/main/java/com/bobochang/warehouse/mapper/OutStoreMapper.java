package com.bobochang.warehouse.mapper;


import com.bobochang.warehouse.entity.OutStore;
import com.bobochang.warehouse.page.Page;

import java.util.List;

public interface OutStoreMapper {

    //添加出库单的方法
    public int insertOutStore(OutStore outStore);

    //查询出库单总行数的方法
    public int outStoreCount(OutStore outStore);

    //分页查询出库单的方法
    public List<OutStore> outStorePage(Page page, OutStore outStore);

    //根据id将出库单状态改为已出库的方法
    public int updateIsOutById(Integer outsId);
}
