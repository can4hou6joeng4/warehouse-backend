package com.bobochang.warehouse;

import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.hibernate.validator.constraints.Range;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author LI
 * @date 2023/10/19
 * 用于测试工作流
 */
@SpringBootTest
@Slf4j
public class ActivitiTests {
    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private ManagementService managementService;
    /**
     * 部署流程定义
     */
    @Test
    void createDeploy(){
        InputStream inputStream = getClass().getResourceAsStream("/processes/test2.bpmn20.xml");
        repositoryService.createDeployment()
                .addInputStream("/processes/test2.bpmn20.xml", inputStream)
                .deploy(); //demo2:1:81952be3-6e2b-11ee-a90a-48a47209a1e7
    }

    /**
     * 开始流程定义
     */
    @Test
    void startInstance(){
        ProcessInstance processInstance = runtimeService.startProcessInstanceById("demo2:1:81952be3-6e2b-11ee-a90a-48a47209a1e7");
        log.info(processInstance.getProcessInstanceId());
        log.info(processInstance.getId()); // 46ebc9c1-6e2f-11ee-9c8c-48a47209a1e7
    }

    /**
     * 根据流程实例id获得流程实例的当前任务和执行人
     */
    @Test
    void getTaskAndAssigneeByInstance(){
        Task nowTask = taskService.createTaskQuery()
                .processInstanceId("97db05b6-6e4b-11ee-ad2e-48a47209a1e7")
                .singleResult();
        log.info(nowTask.getAssignee());
        log.info(nowTask.getName());
//        log.info(nowTask.get);
    }

    /**
     * 根据assignee查看当前未完成的任务并完成
     */
    @Test
    void completeTaskByAssignee(){
        TaskQuery query = taskService.createTaskQuery().processInstanceId("46ebc9c1-6e2f-11ee-9c8c-48a47209a1e7");
        System.out.println(query.list());
//        taskService.complete(query.list().get(0).getId());
    }

    /**
     * 根据流程实例id查询任务
     */
    @Test
    void completeTaskByInstanceId(){
        List<String> list = new ArrayList<>();
        list.add("46ebc9c1-6e2f-11ee-9c8c-48a47209a1e7");
        TaskQuery query = taskService.createTaskQuery().processInstanceIdIn(list);
        System.out.println(query.list());
//        taskService.complete(query.list().get(0).getId());
    }

    /**
     * 候选人拾取并完成任务
     */
    @Test
    void claimTask(){
        //校验该用户有没有拾取任务的资格
        Task task = taskService.createTaskQuery()
                .processInstanceId("46ebc9c1-6e2f-11ee-9c8c-48a47209a1e7")
                .taskCandidateUser("supper_manage")//根据候选人查询
                .singleResult();

        System.out.println(task.getName());
    }

    @Test
    void clearActivitiData() {
    }
}
