package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Supply;
import com.bobochang.warehouse.service.SupplyService;
import com.bobochang.warehouse.mapper.SupplyMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【supply(供货商)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class SupplyServiceImpl extends ServiceImpl<SupplyMapper, Supply>
    implements SupplyService{

}




