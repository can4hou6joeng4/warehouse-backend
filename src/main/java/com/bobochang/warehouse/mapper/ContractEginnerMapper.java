package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.ContractEginner;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author magic'book
* @description 针对表【contract_eginner】的数据库操作Mapper
* @createDate 2023-12-28 22:10:32
* @Entity com.bobochang.warehouse.entity.ContractEginner
*/
public interface ContractEginnerMapper extends BaseMapper<ContractEginner> {

    void insertContract(ContractEginner contractEginner);

    List<String> selectProductById(Integer contractId);

    ContractEginner selectByProductAndContract(Integer productId, Integer contractId);

    void updateIfRatioById(ContractEginner contractEginner);
}




