package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Product;
import com.bobochang.warehouse.service.ProductService;
import com.bobochang.warehouse.mapper.ProductMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【product(商品表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product>
    implements ProductService{

}




