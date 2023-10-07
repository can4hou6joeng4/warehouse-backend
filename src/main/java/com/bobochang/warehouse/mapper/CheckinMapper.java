package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.dto.PageCheckinDto;
import com.bobochang.warehouse.entity.Checkin;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface CheckinMapper {

    // 判断日期内是否有考勤记录
    public Integer haveCheckin(HashMap param);
    public void insert(Checkin checkin);
    public HashMap searchTodayCheckin(int userId);
    public long searchCheckinDays(int userId);
    public ArrayList<HashMap> searchWeekCheckin(HashMap param);

    public ArrayList<HashMap> searchAllCheckin(int userId);

    public int selectCheckinCount(PageCheckinDto page);

    // 分页查询合同
    public ArrayList<HashMap> selectCheckinPage(PageCheckinDto page,Checkin checkin);


}