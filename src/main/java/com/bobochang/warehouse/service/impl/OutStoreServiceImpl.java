package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.dto.OutSummaryDto;
import com.bobochang.warehouse.entity.*;
import com.bobochang.warehouse.mapper.OutStoreMapper;
import com.bobochang.warehouse.mapper.ProductMapper;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.MaterialService;
import com.bobochang.warehouse.service.OutStoreService;
import com.bobochang.warehouse.service.ProductMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

/**
* @author HuihuaLi
* @description 针对表【out_store(出库单)】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class OutStoreServiceImpl extends ServiceImpl<OutStoreMapper, OutStore>
    implements OutStoreService {
    //注入OutStoreMapper
    @Resource
    private OutStoreMapper outStoreMapper;

    //注入ProductMapper
    @Autowired
    private ProductMapper productMapper;
    
    @Autowired
    private MaterialService materialService;
    
    @Autowired
    private ProductMaterialService productMaterialService;

    //添加出库单的业务方法
    @Override
    public Result saveOutStore(OutStore outStore) {
        //添加出库单
        int i = outStoreMapper.insertOutStore(outStore);
        if(i>0){
            return Result.ok("添加出库单成功！");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "添加出库单失败！");
    }

    //分页查询出库单的业务方法
    @Override
    public Page outStorePage(Page page, OutStore outStore) {

        //查询出库单总行数
        int outStoreCount = outStoreMapper.outStoreCount(outStore);

        //分页查询出库单
        List<OutStore> outStoreList = outStoreMapper.outStorePage(page, outStore);

        //将查询到的总行数和当前页数据封装到Page对象
        page.setTotalNum(outStoreCount);
        page.setResultList(outStoreList);

        return page;
    }

    @Override
    public int updateOutStoreById(OutStore outStore) {
        return outStoreMapper.updateOutStoreById(outStore);
    }

    //确定出库的业务方法
    @Transactional//事务处理
    @Override
    public Result confirmOutStore(OutStore outStore) {
        //根据id将出库单状态改为已出库
        int i = outStoreMapper.updateIsOutById(outStore.getOutsId());
        if(i>0){
            //根据商品id减商品库存
            List<ProductMaterial> productMaterialList = productMaterialService.selectRatioById(String.valueOf(outStore.getProductId()));
            for (ProductMaterial productMaterial:productMaterialList){
                double num = Math.round((outStore.getOutNum() * productMaterial.getRatio()) * 100.0) / 100.0;
                InStore inStore = new InStore();
                inStore.setInNum(-num);
                inStore.setMaterialId(productMaterial.getMaterialId());
                materialService.addInventById(inStore);
            }
            return Result.ok("出库成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "出库失败！");
    }

    @Override
    public Page outStoreSummaryPage(Page page, OutStore outStore) {
        List<OutSummaryDto> outSummaryDtoList = outStoreMapper.selectOutStoreSummaryPage(page, outStore);
        for (OutSummaryDto outSummaryDto : outSummaryDtoList){
            BigDecimal sum = outStoreMapper.selectOutStoreSummaryMoenyByWorkRegion(outSummaryDto.getWorkRegion());
            outSummaryDto.setTotalAmount(sum);
        }
        page.setResultList(outSummaryDtoList);
        return page;
    }
}




