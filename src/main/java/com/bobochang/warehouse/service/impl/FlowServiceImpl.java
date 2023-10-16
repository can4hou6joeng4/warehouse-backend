package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.mapper.FlowMapper;
import com.bobochang.warehouse.service.FlowService;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LI
 * @date 2023/10/10
 */
@Service
@Slf4j
public class FlowServiceImpl implements FlowService {
    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private FlowMapper flowMapper;

    @Override
    public void insertFlow(Flow flow) {
        flowMapper.insertFlow(flow);
    }

    @Override
    public void updateFlow(Flow flow) {
        flowMapper.updateFlow(flow);
    }

    @Override
    public Flow selectByInstanceId(String instanceId) {
        return flowMapper.selectByInstanceId(instanceId);
    }
}
