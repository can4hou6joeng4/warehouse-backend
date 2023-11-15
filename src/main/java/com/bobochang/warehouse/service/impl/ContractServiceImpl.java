package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.dto.MaterialNumDto;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.FaceModel;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.mapper.ContractMapper;
import com.bobochang.warehouse.mapper.FaceModelMapper;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.ActivitiService;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.service.FaceModelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author bobochang
 * @Description
 * @Date 2023/9/19 - 10:55
 */
@Service
@Slf4j
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract>
        implements ContractService {

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
        System.out.println(contract);
        log.info(String.valueOf(contract.getFiles()));
        contract.setContractState("0");

        // 根据合同id查询合同
        Contract oldContract = contractMapper.findContractByName(contract.getContractName());
        if (oldContract != null) {
            return Result.err(Result.CODE_ERR_BUSINESS, "该合同已存在！");
        }
        contract.setFiles(contract.getFiles());
        // 合同不存在 添加合同
        contractMapper.insertContract(contract);
        
        return Result.ok("添加合同成功");
    }

    @Override
    public int updateContractState(Contract contract) {
        // 根据合同 id 修改合同状态
        return contractMapper.updateContractState(contract);
    }

    @Override
    public Result updateContractById(Contract contract) {
        contract.setFiles(accessPath+contract.getFiles());
        // 根据合同 id 修改合同昵称
        int i = contractMapper.updateContractById(contract);
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

    @Override
    public Result selectAllContract() {
        List<Contract> contractList = contractMapper.selectAllContract();
        return Result.ok(contractList);
    }

    @Override
    public int updateContractIfPurchase(Contract contract) {
        
        return contractMapper.updateContractIfPurchase(contract);
    }

    @Override
    public Result getNeedMaterialNum(MaterialNumDto materialNumDto) {
        MaterialNumDto numDto = contractMapper.getNeedMaterialNum(materialNumDto);
        return Result.ok(numDto);
    }
}
