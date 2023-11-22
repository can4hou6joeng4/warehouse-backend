package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.Customer;
import com.bobochang.warehouse.mapper.CustomerMapper;
import com.bobochang.warehouse.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author magic'book
* @description 针对表【customer】的数据库操作Service实现
* @createDate 2023-11-21 09:46:37
*/
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer>
    implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    
    @Override
    public List<Customer> getAll() {
        return customerMapper.getAll();
    }
}




