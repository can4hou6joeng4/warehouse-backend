package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Store;
import com.bobochang.warehouse.service.StoreService;
import com.bobochang.warehouse.mapper.StoreMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【store(仓库表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class StoreServiceImpl extends ServiceImpl<StoreMapper, Store>
    implements StoreService{

}




