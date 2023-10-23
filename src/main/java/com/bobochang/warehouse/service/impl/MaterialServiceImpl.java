package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.Material;
import com.bobochang.warehouse.entity.Product;
import com.bobochang.warehouse.mapper.MaterialMapper;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author magic'book
* @description 针对表【material(商品表)】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class MaterialServiceImpl extends ServiceImpl<MaterialMapper, Material>
    implements MaterialService {
    @Autowired
    private MaterialMapper materialMapper;
    @Override
    public Page queryMaterialPage(Page page, Material material) {

        //查询商品总行数
//        int productCount = materialMapper.selectMaterialPage(material);

        //分页查询商品
        List<Material> materialList = materialMapper.selectMaterialPage(page, material);

        //将查询到的总行数和当前页数据组装到Page对象
//        page.setTotalNum(productCount);
        page.setResultList(materialList);

        return page;
    }


}




