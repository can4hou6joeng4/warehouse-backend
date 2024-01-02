package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.entity.ContractEginner;
import com.bobochang.warehouse.service.ContractEginnerService;
import com.bobochang.warehouse.mapper.ContractEginnerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【contract_eginner】的数据库操作Service实现
* @createDate 2023-12-28 22:10:32
*/
@Service
public class ContractEginnerServiceImpl extends ServiceImpl<ContractEginnerMapper, ContractEginner>
    implements ContractEginnerService{
    @Autowired
    private ContractEginnerMapper contractEginnerMapper;

    @Override
    public void saveContractEginner(ContractEginner contractEginner) {
        contractEginnerMapper.insertContract(contractEginner);
    }
}




