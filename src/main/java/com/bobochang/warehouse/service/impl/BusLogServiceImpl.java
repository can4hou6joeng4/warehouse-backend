package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.BusLog;
import com.bobochang.warehouse.service.BusLogService;
import com.bobochang.warehouse.mapper.BusLogMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【bus_log(业务操作日志)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class BusLogServiceImpl extends ServiceImpl<BusLogMapper, BusLog>
    implements BusLogService{

}




