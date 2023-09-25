package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.page.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ContractMapper {
    // 根据合同 id 查询合同
    public Contract findContractById(Integer contractId);

    // 根据合同名称查询合同
    public Contract findContractByName(String contractName);

    // 查询合同总行数
    public int selectContractCount(Contract contract);

    // 分页查询合同
    public List<Contract> selectContractPage();

    // 添加合同
    public int insertContract(Contract contract);

    // 根据合同 id 修改合同状态
    public int updateContractState(Contract contract);

    // 根据合同 id 修改合同名称
    public int updateNameById(Contract contract);
}
