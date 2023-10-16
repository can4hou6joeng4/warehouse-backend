package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.BusLogDao;
import com.bobochang.warehouse.mapper.BusLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LI
 * @date 2023/10/16
 */
@Service
public class BusLogServiceImpl {
    @Autowired
    private BusLogMapper busLogMapper;

    public void insert(BusLogDao busLogDao) {

        busLogMapper.insertLog(busLogDao);
    }

}
