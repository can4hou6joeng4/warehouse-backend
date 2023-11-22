package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.Customer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author magic'book
* @description 针对表【customer】的数据库操作Mapper
* @createDate 2023-11-21 09:46:37
* @Entity com.bobochang.warehouse.entity.Customer
*/
public interface CustomerMapper extends BaseMapper<Customer> {

    List<Customer> getAll();
}




