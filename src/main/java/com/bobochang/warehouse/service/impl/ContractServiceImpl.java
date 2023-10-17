package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.mapper.ContractMapper;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author bobochang
 * @Description
 * @Date 2023/9/19 - 10:55
 */
@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractMapper contractMapper;

    @Value("${file.upload-path}")
    private String accessPath;

    @Override
    public Contract findContractById(Integer contractId) {
        return contractMapper.findContractById(contractId);
    }

    @Override
    public Page queryContractPage(Page page, Contract contract) {
        // 查询合同总行数
        int contractCount = contractMapper.selectContractCount(contract);

        // 分页查询合同
        List<Contract> contractList = contractMapper.selectContractPage(page, contract);

        // 将查询到的总行数和当前页数据组装到 Page 对象
        page.setTotalNum(contractCount);
        page.setResultList(contractList);
        return page;
    }

    @Override
    public Result saveContract(Contract contract) {
        // 根据合同id查询合同
        Contract oldContract = contractMapper.findContractByName(contract.getContractName());
        if (oldContract != null) {
            return Result.err(Result.CODE_ERR_BUSINESS, "该合同已存在！");
        }
        contract.setFiles(accessPath+contract.getFiles());
        // 合同不存在 添加合同
        contractMapper.insertContract(contract);
        return Result.ok("添加合同成功");
    }

    @Override
    public Result updateContractState(Contract contract) {
        // 根据合同 id 修改合同状态
        int i = contractMapper.updateContractState(contract);
        if (i > 0) {
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "修改失败");
    }

    @Override
    public Result updateContractName(Contract contract) {
        contract.setFiles(accessPath+contract.getFiles());
        // 根据合同 id 修改合同昵称
        int i = contractMapper.updateNameById(contract);
        if (i > 0) {
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS, "修改失败");
    }

    @Override
    public int searchContractCount(Contract contract) {
        return contractMapper.selectContractCount(contract);
    }

    @Override
    public Contract findContractById(int contractId) {
        return contractMapper.findContractById(contractId);
    }
}
