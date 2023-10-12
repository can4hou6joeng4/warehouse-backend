package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.Result;

import java.util.List;
import java.util.Map;

/**
 * 工作流服务类
 */
public interface ActivitiService {
    public String xmlUpload(String file,String fileName);

    public Result haveTask(int userId);

    Result startInstance(Map<String, String> map);

    public void completeTask(String assignee, Flow flow);

    List<Object> searchTask(String roleCode);
}
