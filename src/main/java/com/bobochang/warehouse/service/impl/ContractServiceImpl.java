package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Contract;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.mapper.ContractMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【contract(合同表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract>
    implements ContractService{

}




