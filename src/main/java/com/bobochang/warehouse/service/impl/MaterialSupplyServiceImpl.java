package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.MaterialSupply;
import com.bobochang.warehouse.mapper.MaterialSupplyMapper;
import com.bobochang.warehouse.service.MaterialSupplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
* @author HuihuaLi
* @description 针对表【material_supply】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class MaterialSupplyServiceImpl extends ServiceImpl<MaterialSupplyMapper, MaterialSupply>
    implements MaterialSupplyService {
    @Autowired
    private MaterialSupplyMapper materialSupplyMapper;
    
    @Override
    public BigDecimal selectPrice(MaterialSupply materialSupply){
        QueryWrapper<MaterialSupply> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("material_id", materialSupply.getMaterialId());
        queryWrapper.eq("supply_id", materialSupply.getSupplyId());
        
        MaterialSupply targetMaterialSupply = materialSupplyMapper.selectOne(queryWrapper);
        return targetMaterialSupply.getQuotation();
    }
}




