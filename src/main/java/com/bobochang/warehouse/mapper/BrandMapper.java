package com.bobochang.warehouse.mapper;


import com.bobochang.warehouse.entity.Brand;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BrandMapper {

    //查询所有品牌的方法
    public List<Brand> findAllBrand();
}
