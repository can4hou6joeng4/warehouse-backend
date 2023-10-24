package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.InStore;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.mapper.PurchaseMapper;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.InStoreService;
import com.bobochang.warehouse.mapper.InStoreMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author HuihuaLi
* @description 针对表【in_store(入库单)】的数据库操作Service实现
* @createDate 2023-10-20 15:37:44
*/
@Service
public class InStoreServiceImpl extends ServiceImpl<InStoreMapper, InStore>
    implements InStoreService{
    @Autowired
    private InStoreMapper inStoreMapper;
    
    @Autowired
    private PurchaseMapper purchaseMapper;
    
    @Override
    public Page queryInStorePage(Page page, InStore inStore) {

        //查询入库单总行数
        int inStoreCount = inStoreMapper.selectInStoreCount(inStore);

        //分页查询入库单
        List<InStore> inStoreList = inStoreMapper.selectInStorePage(page, inStore);

        //将查询到的总行数和当前页数据封装到Page对象
        page.setTotalNum(inStoreCount);
        page.setResultList(inStoreList);

        return page;
    }

    @Transactional//事务处理
    @Override
    public Result saveInStore(InStore inStore, Integer buyId) {
        //添加入库单
        int i = inStoreMapper.insertInStore(inStore);
        if(i>0){
            //根据id将采购单状态改为已入库
            int j = purchaseMapper.updateIsInById(buyId);
            if(j>0){
                return Result.ok("入库单添加成功！");
            }
            return Result.err(Result.CODE_ERR_BUSINESS, "入库单添加失败！");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "入库单添加失败！");
    }

}




