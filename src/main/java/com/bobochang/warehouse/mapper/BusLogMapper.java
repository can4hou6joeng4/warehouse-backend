package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.entity.BusLogDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author bobochang
 * @Description
 * @Date 2023/10/16 - 15:06
 */
@Mapper
public interface BusLogMapper {

    public BusLog insertLog(BusLogDao busLogDao);
}
