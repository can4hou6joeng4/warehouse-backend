package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Workday;
import com.bobochang.warehouse.service.WorkdayService;
import com.bobochang.warehouse.mapper.WorkdayMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【workday】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class WorkdayServiceImpl extends ServiceImpl<WorkdayMapper, Workday>
    implements WorkdayService{

}



