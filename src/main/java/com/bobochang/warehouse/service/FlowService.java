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
    // 添加工作流业务记录
    public void insertFlow(Flow flow);

    // 更新工作流业务记录
    void updateFlow(Flow flow);

    // 根据流程实例id查询工作流记录
    Flow selectByInstanceId(String instanceId);
}
