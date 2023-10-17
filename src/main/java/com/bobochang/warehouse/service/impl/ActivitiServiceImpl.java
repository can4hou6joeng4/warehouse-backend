package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.dto.TaskDTO;
import com.bobochang.warehouse.entity.Contract;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.entity.Flow;
import com.bobochang.warehouse.entity.User;
import com.bobochang.warehouse.mapper.ContractMapper;
import com.bobochang.warehouse.mapper.UserMapper;
import com.bobochang.warehouse.service.ActivitiService;
import com.bobochang.warehouse.service.ContractService;
import com.bobochang.warehouse.service.FlowService;
import com.bobochang.warehouse.service.UserService;
import jdk.dynalink.linker.LinkerServices;
import lombok.extern.slf4j.Slf4j;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author LI
 * @date 2023/10/9
 */
@Service
@Slf4j
public class ActivitiServiceImpl implements ActivitiService {
    @Value("${file.xml-upload-path}")
    private String xmlUploadPath;

    @Autowired
    private UserService userService;

    @Autowired
    private ContractService contractService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private FlowService flowService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private RepositoryService repositoryService;

    @Value("${warehouse.deploymentId}")
    private String deploymentId;

    /**
     * 上传流程定义的xml文件
     * @param file xml文件
     * @param fileName 文件名称
     * @return
     */
    @Override
    public String xmlUpload(String file,String fileName) {
        if (file.isEmpty()) {
            return "";
        }
        try {
            //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
            File uploadDirFile = ResourceUtils.getFile(xmlUploadPath);
            //拿到图片上传到的目录的磁盘路径
            String uploadDirPath = uploadDirFile.getAbsolutePath();
            // 获得文件字节流并写入文件
            byte[] fileBytes = file.getBytes();
            String filePath = uploadDirPath+"\\"+fileName+".bpmn20.xml";
            Files.write(Path.of(filePath), fileBytes);
            return filePath;
        } catch (IOException e) {
            return "";
        }
    }

    /**
     * 查看用户是否有任务未完成
     * @param userId 用户id
     * @return
     */
    @Override
    public Result haveTask(int userId) {
        String roleCode = userService.searchRoleCodeById(userId);

        // 查询未审核的合同列表，如果有为审核的合同
        Contract contract = new Contract();
        contract.setContractState("0");
        int contractCount = contractService.searchContractCount(contract);

        // 如果是超级管理员则看合同有没有审核
        if (roleCode.equals("supper_manage")){
            if(contractCount == 0){
                return Result.ok("暂无要处理的合同");
            }else{
                return Result.ok("有还未审核的合同");
            }
        }else{
            // 其他用户则是查询是否有任务
            TaskQuery query = taskService.createTaskQuery().taskAssignee(roleCode);
            List<Task> taskList = query.list();

            // 将查询到的任务用系统实例类封装返回，否则会有延迟加载的错误
            List<TaskDTO> taskDTOList = new ArrayList<>();
            for (Task task : taskList) {
                TaskDTO taskDTO = new TaskDTO();
                BeanUtils.copyProperties(task, taskDTO);
                taskDTOList.add(taskDTO);
            }
            return Result.ok(taskDTOList);
        }
    }

    /**
     * 开启流程实例
     * @param map 包括合同状态以及工作流的类型
     * @return
     */
    @Override
    public Result startInstance(Map<String, String> map) {
        try{
            // 改变合同状态，将合同状态由未审核转为待结算，进而开启流程实例
            Contract contract = new Contract();
            contract.setContractId(Integer.valueOf(map.get("contractId")));
            contract.setContractState("1");

            contractService.updateContractState(contract);
            // 启动流程实例
            Map<String, Object> variables = new HashMap<>();
//            variables.put("produce_man", "produce_man");
//            variables.put("out_store", "out_store");
//            variables.put("supper_manage", "supper_manage");
//            variables.put("purchase_man", "purchase_man");
//            variables.put("in_store", "in_store");
            variables.put("status", Integer.valueOf(map.get("state")));
            ProcessInstance processInstance = runtimeService.startProcessInstanceById(deploymentId,variables);

            // 保存实例记录
            Flow flow = new Flow();
            flow.setInstanceId(processInstance.getId());
            flow.setContractId(contract.getContractId());
            flow.setState(Integer.valueOf(map.get("state")));
            flowService.insertFlow(flow);

            // 完成第一个合同审核的任务
            Task task = taskService.createTaskQuery()
                    .processInstanceId(flow.getInstanceId())
                    .singleResult();
            taskService.complete(task.getId());

            return Result.ok("启动流程成功");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 完成流程中的任务
     * @param userCode 用户代码
     * @param flow 流程实例
     */
    @Override
    public void completeTask(String userCode, Flow flow) {
        // 查询用户角色
        User user = userService.findUserByCode(userCode);
        String assignee = userService.searchRoleCodeById(user.getUserId());

        // 根据角色查看自身未完成的任务并完成任务
        TaskQuery query = taskService.createTaskQuery().taskAssignee(assignee);

        flow.setInstanceId(query.list().stream()
                .map(Task::getProcessInstanceId)
                .collect(Collectors.toList()).get(0));

        taskService.complete(query.list().get(0).getId());

        // 更新工作流记录
        flowService.updateFlow(flow);
    }

    /**
     * 查看用户所有的流程任务
     * @param roleCode 用户代码
     * @return
     */
    @Override
    public List<Object> searchTask(String roleCode) {
        List<Object> result = new ArrayList<>();

        List<Map<String, String>> taskNodes = searchAllTaskByDefinitionId();
        result.addAll(runningTask(roleCode,taskNodes));
        result.addAll(historyTask(roleCode,taskNodes));
        if(roleCode.equals("supper_manage")){
            result.addAll(allTask(roleCode,taskNodes));
        }
        return result.stream()
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * 查询的是轮到用户完成任务的流程实例
     * @param assignee 用户角色信息
     * @param taskNodes 所有任务列表
     * @return list
     */
    private List<Object> runningTask(String assignee,List<Map<String, String>> taskNodes){
        TaskQuery runningQuery = taskService.createTaskQuery().taskAssignee(assignee);
        List<Task> runningTasks = runningQuery.list();

        List<Object> result = new ArrayList<>();
        if(!runningTasks.isEmpty()){
            for(Task task : runningTasks){
                Map<String, Object> taskMap = new HashMap<>();

                taskMap.put("instanceId",task.getProcessInstanceId());
                // 流程当前进行的任务和负责人
                Task nowTask = taskService.createTaskQuery()
                        .processInstanceId(task.getProcessInstanceId())
                        .singleResult();


                TaskDTO taskDTO = new TaskDTO();
                BeanUtils.copyProperties(nowTask,taskDTO);
                taskMap.put("task", taskDTO.getName());
                taskMap.put("assignee",taskDTO.getAssignee());

                // 获得流程的所有任务
                Flow flow = flowService.selectByInstanceId(task.getProcessInstanceId());
                taskMap.put("allTask",differentTask(flow.getState(),taskNodes));

                // 获得当前流程所属合同名称
                Contract contract = contractService.findContractById(flow.getContractId());
                taskMap.put("contractName", contract.getContractName());

                taskMap.put("flag","进行中");

                result.add(taskMap);
            }
        }
        return result;
    }

    /**
     * 查询的是用户历史流程实例
     * @param assignee 用户的角色信息
     * @param taskNodes 所有任务列表
     * @return list
     */
    private List<Object> historyTask(String assignee,List<Map<String, String>> taskNodes){
        List<Object> list = new ArrayList<>();

        HistoricProcessInstanceQuery historicQuery = historyService.createHistoricProcessInstanceQuery()
                .involvedUser(assignee)
                .finished();
        List<HistoricProcessInstance> historicProcessInstances = historicQuery.list();
        if (!historicProcessInstances.isEmpty()){
            for (HistoricProcessInstance historicProcessInstance: historicProcessInstances){
                Map<String, Object> taskMap = new HashMap<>();

                taskMap.put("instanceId", historicProcessInstance.getId());

                Flow flow = flowService.selectByInstanceId(historicProcessInstance.getId());
                taskMap.put("allTask",differentTask(flow.getState(),taskNodes));

                // 获得当前流程所属合同名称
                Contract contract = contractService.findContractById(flow.getContractId());
                taskMap.put("contractName", contract.getContractName());

                taskMap.put("flag","已结束");

                list.add(taskMap);
            }
        }
        return list;
    }

    /**
     * 超级管理员用于查询正在进行中的所有流程实例
     * @param assignee 用户角色信息
     * @param taskNodes 所有任务的列表
     * @return list
     */
    private List<Object> allTask(String assignee,List<Map<String, String>> taskNodes){
        List<Object> list = new ArrayList<>();
        List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery()
                .processDefinitionId(deploymentId)
                .list();
        for (ProcessInstance processInstance : processInstances){
            Map<String, Object> taskMap = new HashMap<>();

            taskMap.put("instanceId",processInstance.getProcessInstanceId());

            // 流程当前进行的任务和负责人
            Task nowTask = taskService.createTaskQuery()
                    .processInstanceId(processInstance.getProcessInstanceId())
                    .singleResult();

            TaskDTO taskDTO = new TaskDTO();
            BeanUtils.copyProperties(nowTask,taskDTO);
            taskMap.put("task", taskDTO.getName());
            taskMap.put("assignee",taskDTO.getAssignee());

            Flow flow = flowService.selectByInstanceId(processInstance.getId());

            // 获得流程的所有任务
            taskMap.put("allTask", differentTask(flow.getState(), taskNodes));

            // 获得当前流程所属合同名称
            Contract contract = contractService.findContractById(flow.getContractId());
            taskMap.put("contractName", contract.getContractName());

            taskMap.put("flag","进行中");

            list.add(taskMap);
        }
        return list;
    }

    /**
     * 根据部署的流程定义id查询该流程的所有任务列表
     * @return taskNodes 返回该流程定义的所有任务
     */
    private List<Map<String, String>> searchAllTaskByDefinitionId(){
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .processDefinitionId(deploymentId)
                .singleResult();
        List<Map<String, String>> taskNodes = new ArrayList<>();


        if (processDefinition != null) {
            List<UserTask> userTasks = repositoryService.getBpmnModel(deploymentId)
                    .getMainProcess().findFlowElementsOfType(UserTask.class);

            for (UserTask userTask : userTasks) {
                Map<String, String> taskInfo = new HashMap<>();
                taskInfo.put("taskName",userTask.getName());
                taskInfo.put("taskAssignee",userTask.getAssignee());
                taskInfo.put("taskId",userTask.getId());
                taskNodes.add(taskInfo);
            }
        }

        return taskNodes;
    }

    /**
     * 区分不同流程实例的任务
     * @param taskState 任务状态
     * @param taskNodes 所有任务的列表
     * @return allTask 返回当前流程实例的任务列表
     */
    private List<Map<String, String>> differentTask(Integer taskState, List<Map<String, String>> taskNodes){
        List<Map<String, String>> allTask = new ArrayList<>(taskNodes);
        if(taskState == 0){
            allTask.removeIf(map -> map.get("taskName").equals("采购确认") || map.get("taskName").equals("入库确认"));
        }
        return allTask;
    }

    @Override
    public void completeGroupTask(String userCode, Flow flow) {
        // 查询用户角色
        User user = userService.findUserByCode(userCode);
        String assignee = userService.searchRoleCodeById(user.getUserId());

        // 根据角色查看自身未完成的任务并完成任务
        TaskQuery query = taskService.createTaskQuery().taskAssignee(assignee);

        flow.setInstanceId(query.list().stream()
                .map(Task::getProcessInstanceId)
                .collect(Collectors.toList()).get(0));

        taskService.complete(query.list().get(0).getId());

        // 更新工作流记录
        flowService.updateFlow(flow);
    }
}
