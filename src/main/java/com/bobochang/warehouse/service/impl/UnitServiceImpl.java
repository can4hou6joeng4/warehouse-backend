package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.Unit;
import com.bobochang.warehouse.mapper.UnitMapper;
import com.bobochang.warehouse.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

//指定缓存的名称即键的前缀,一般是@CacheConfig标注的类的全类名
@CacheConfig(cacheNames = "com.bobochang.warehouse.service.impl.UnitServiceImpl")
@Service
public class UnitServiceImpl implements UnitService {

    //注入UnitMapper
    @Autowired
    private UnitMapper unitMapper;

    /*
      查询所有单位的业务方法
     */
    //对查询到的所有单位进行缓存,缓存到redis的键为all:unit
    @Cacheable(key = "'all:unit'")
    @Override
    public List<Unit> queryAllUnit() {
        //查询所有单位
        return unitMapper.findAllUnit();
    }
}
