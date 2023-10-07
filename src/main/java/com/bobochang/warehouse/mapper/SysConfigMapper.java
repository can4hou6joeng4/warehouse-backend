package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.SysConfig;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysConfigMapper {
    public List<SysConfig> selectAllParam();
}