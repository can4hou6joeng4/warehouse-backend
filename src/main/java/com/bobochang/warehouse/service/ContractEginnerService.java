package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.ContractEginner;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author magic'book
* @description 针对表【contract_eginner】的数据库操作Service
* @createDate 2023-12-28 22:10:32
*/
public interface ContractEginnerService extends IService<ContractEginner> {

    void saveContractEginner(ContractEginner contractEginner);
}
