package com.bobochang.warehouse.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface HolidaysMapper {

    // 判断今天是否是特殊节假日
    public Integer searchTodayIsHolidays();
    public ArrayList<String> searchHolidaysInRange(HashMap param);
}