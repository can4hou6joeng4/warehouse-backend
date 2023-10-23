package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Material;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bobochang.warehouse.entity.Product;
import com.bobochang.warehouse.page.Page;

/**
* @author magic'book
* @description 针对表【material(商品表)】的数据库操作Service
* @createDate 2023-10-20 15:37:44
*/
public interface MaterialService extends IService<Material> {

    public Page queryMaterialPage(Page page, Material material);

}
