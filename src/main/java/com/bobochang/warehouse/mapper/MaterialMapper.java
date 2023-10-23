package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.Material;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bobochang.warehouse.entity.Product;
import com.bobochang.warehouse.page.Page;

import java.util.List;

/**
* @author magic'book
* @description 针对表【material(商品表)】的数据库操作Mapper
* @createDate 2023-10-20 15:37:44
* @Entity generator.domain.Material
*/
public interface MaterialMapper extends BaseMapper<Material> {
    List<Material> selectMaterialPage(Page page, Material material);

}



