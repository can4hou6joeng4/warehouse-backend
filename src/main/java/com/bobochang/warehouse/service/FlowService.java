package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.Result;
import org.springframework.stereotype.Service;
/**
 * @author LI
 * @date 2023/10/10
 */
@Service
public interface FlowService {
    public void insertFlow(Flow flow);

    void updateFlow(Flow flow);

    String selectByInstanceId(String instanceId);
}
