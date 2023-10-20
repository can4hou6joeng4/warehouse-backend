package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.InStore;
import com.bobochang.warehouse.service.InStoreService;
import com.bobochang.warehouse.mapper.InStoreMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【in_store(入库单)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class InStoreServiceImpl extends ServiceImpl<InStoreMapper, InStore>
    implements InStoreService{

}




