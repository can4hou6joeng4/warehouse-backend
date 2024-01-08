package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.ContractEginner;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author magic'book
* @description 针对表【contract_eginner】的数据库操作Service
* @createDate 2023-12-28 22:10:32
*/
public interface ContractEginnerService extends IService<ContractEginner> {

    void saveContractEginner(ContractEginner contractEginner);

    List<String> selectProductById(Integer contractId);

    ContractEginner selectByProductAndContract(Integer productId,Integer contractId);

    void updateIfRatioById(ContractEginner contractEginner);
}
