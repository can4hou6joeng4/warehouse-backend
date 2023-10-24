package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.BusLog;
import com.bobochang.warehouse.service.BusLogService;
import com.bobochang.warehouse.mapper.BusLogMapper;
import org.springframework.stereotype.Service;

/**
* @author HuihuaLi
* @description 针对表【bus_log(业务操作日志)】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class BusLogServiceImpl extends ServiceImpl<BusLogMapper, BusLog>
    implements BusLogService{

}




