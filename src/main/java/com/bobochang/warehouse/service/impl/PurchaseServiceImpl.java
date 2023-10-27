package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.ProductMaterial;
import com.bobochang.warehouse.entity.Purchase;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.service.ProductMaterialService;
import com.bobochang.warehouse.service.PurchaseService;
import com.bobochang.warehouse.mapper.PurchaseMapper;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @author HuihuaLi
* @description 针对表【buy_list(采购单)】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class PurchaseServiceImpl extends ServiceImpl<PurchaseMapper, Purchase>
    implements PurchaseService {
    //注入PurchaseMapper
    @Resource
    private PurchaseMapper purchaseMapper;

    
    @Resource
    private ContractService contractService;
    
    @Autowired
    private ProductMaterialService productMaterialService;
    
//    添加采购单的业务方法
    @Override
    public Result savePurchase(Purchase purchase) {
        //添加采购单
        int i = purchaseMapper.insertPurchase(purchase);
        if(i>0){
            return Result.ok("采购单添加成功！");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "采购单添加失败！");
    }

    @Override
    public List<Purchase> selectPurchaseByContractId(Integer contractId) {
        
        return purchaseMapper.selectPurchaseByContractId(contractId);
    }

    @Override
    public List<Object> getPurchaseDetail(Integer contractId) {
        Map<String, Object> objectMap = new HashMap<>();

        // 获取采购员
        List<Purchase> list = selectPurchaseByContractId(contractId);
        objectMap.put("buyName", list.get(0).getBuyNum());
        
        // 获取配料比和产品名
        Contract contract = contractService.getBaseMapper().selectById(contractId);
        List<ProductMaterial> productMaterialList = productMaterialService.selectRatioById(String.valueOf(contract.getProductId()));

        objectMap.put("productName", productMaterialList.get(0).getProductName());
        objectMap.put("ratioList",productMaterialList);
        
        // 获取原料名以及选择的对应的供应商
        objectMap.put("purchaseList",list);
        
        List<Object> objectList = new ArrayList<>();
        objectList.add(objectMap);
        return objectList;
    }

    //分页查询采购单的业务方法
    @Override
    public Page queryPurchasePage(Page page, Purchase purchase) {

        //查询采购单总行数
        int purchaseCount = purchaseMapper.selectPurchaseCount(purchase);

        //分页查询采购单
        List<Purchase> purchaseList = purchaseMapper.selectPurchasePage(page, purchase);

        //将查询到的总行数和当前页数据组装到Page对象
        page.setTotalNum(purchaseCount);
        page.setResultList(purchaseList);

        return page;
    }

    //修改采购单的业务方法
    @Override
    public Result updatePurchase(Purchase purchase) {
        //根据id修改采购单
        int i = purchaseMapper.updatePurchaseById(purchase);
        if(i>0){
            return Result.ok("采购单修改成功！");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "采购单修改失败！");
    }

//    //删除采购单的业务方法
//    @Override
//    public Result deletePurchase(Integer buyId) {
//        //根据id删除采购单
//        int i = purchaseMapper.deletePurchaseById(buyId);
//        if(i>0){
//            return Result.ok("采购单删除成功！");
//        }
//        return Result.err(Result.CODE_ERR_BUSINESS, "采购单删除失败！");
//    }
}




