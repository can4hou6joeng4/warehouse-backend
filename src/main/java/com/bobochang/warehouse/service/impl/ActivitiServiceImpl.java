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
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.Deployment;
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

    @Override
    public Result haveTask(int userId) {
        String roleCode = userService.searchRoleCodeById(userId);

        Contract contract = new Contract();
        contract.setContractState("0");
        int contractCount = contractService.searchContractCount(contract);
        if (roleCode.equals("supper_manage")){
            if(contractCount == 0){
                return Result.ok("暂无要处理的合同");
            }else{
                return Result.ok("有还未审核的合同");
            }
        }else{
            TaskQuery query = taskService.createTaskQuery().taskAssignee(roleCode);
            List<Task> taskList = query.list();

            // Convert Task entities to DTOs
            List<TaskDTO> taskDTOList = new ArrayList<>();
            for (Task task : taskList) {
                TaskDTO taskDTO = new TaskDTO();
                BeanUtils.copyProperties(task, taskDTO);
                taskDTOList.add(taskDTO);
            }
            return Result.ok(taskDTOList);
        }
    }

    @Override
    public Result startInstance(Map<String, String> map) {
        try{
            // 改变合同状态，将合同状态由未审核转为待结算
            Contract contract = new Contract();
            System.out.println(map.get("state"));
            contract.setContractId(Integer.valueOf(map.get("contractId")));
            contract.setContractState("1");

            contractService.updateContractState(contract);
            // 启动流程实例
            Map<String, Object> variables = new HashMap<>();
            variables.put("produce_man", "produce_man");
            variables.put("out_store", "out_store");
            variables.put("supper_manage", "supper_manage");
            variables.put("purchase_man", "purchase_man");
            variables.put("in_store", "in_store");
            variables.put("status", Integer.valueOf(map.get("state")));
            ProcessInstance processInstance = runtimeService.startProcessInstanceById("test2:1:bdcff597-68a1-11ee-af2b-48a47209a1e7",variables);

            // 保存实例记录
            Flow flow = new Flow();
            flow.setInstanceId(processInstance.getId());
            flow.setContractId(contract.getContractId());
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

    @Override
    public void completeTask(String userCode, Flow flow) {
        User user = userService.findUserByCode(userCode);
        String assignee = userService.searchRoleCodeById(user.getUserId());

        TaskQuery query = taskService.createTaskQuery().taskAssignee(assignee);

        flow.setInstanceId(query.list().stream()
                .map(Task::getProcessInstanceId)
                .collect(Collectors.toList()).get(0));

        taskService.complete(query.list().get(0).getId());

        flowService.updateFlow(flow);
    }

    @Override
    public List<Object> searchTask(String roleCode) {
        List<Object> result = new ArrayList<>();
        result.addAll(runningTask(roleCode));
        result.addAll(historyTask(roleCode));
        if(roleCode.equals("supper_manage")){
            result.addAll(allTask(roleCode));
        }
        return result;
    }

    private List<Object> runningTask(String assignee){
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
                List<Object> allTask = new ArrayList<>();
                List<Task> tasks = taskService.createTaskQuery().processInstanceId(task.getProcessInstanceId()).list();
                for (Task task1 : tasks) {
                    Map<String, Object> taskInfo = new HashMap<>();
                    taskInfo.put("taskId", task1.getId());
                    taskInfo.put("taskName", task1.getName());
                    taskInfo.put("assignee", task1.getAssignee());
                    taskInfo.put("claimTime", task1.getClaimTime());
                    allTask.add(taskInfo);
                }
                taskMap.put("allTask", allTask);

                // 获得当前流程所属合同名称
                String contractId = flowService.selectByInstanceId(task.getProcessInstanceId());
                Contract contract = contractService.findContractById(Integer.valueOf(contractId));
                taskMap.put("contractName", contract.getContractName());

                taskMap.put("flag","进行中");

                result.add(taskMap);
            }
        }
        return result;
    }

    private List<Object> historyTask(String assignee){
        List<Object> list = new ArrayList<>();

        HistoricProcessInstanceQuery historicQuery = historyService.createHistoricProcessInstanceQuery()
                .involvedUser(assignee)
                .finished();
        List<HistoricProcessInstance> historicProcessInstances = historicQuery.list();
        if (!historicProcessInstances.isEmpty()){
            for (HistoricProcessInstance historicProcessInstance: historicProcessInstances){
                Map<String, Object> taskMap = new HashMap<>();

                log.info(historicProcessInstance.getId());
                taskMap.put("instanceId", historicProcessInstance.getId());

                List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery()
                        .processInstanceId(historicProcessInstance.getId())
                        .list();
                List<Map<String, Object>> allHisTask = new ArrayList<>();
                for (HistoricTaskInstance historicTask : historicTasks) {
                    Map<String, Object> taskHisInfo = new HashMap<>();
                    taskHisInfo.put("taskId", historicTask.getId());
                    taskHisInfo.put("taskName", historicTask.getName());
                    taskHisInfo.put("assignee", historicTask.getAssignee());
                    taskHisInfo.put("claimTime", historicTask.getClaimTime());
                    allHisTask.add(taskHisInfo);
                }
                taskMap.put("allTask",allHisTask);

                // 获得当前流程所属合同名称
                String contractId = flowService.selectByInstanceId(historicProcessInstance.getId());
                Contract contract = contractService.findContractById(Integer.valueOf(contractId));
                taskMap.put("contractName", contract.getContractName());

                taskMap.put("flag","已结束");

                list.add(taskMap);
            }
        }
        return list;
    }

    private List<Object> allTask(String assignee){
        List<Object> list = new ArrayList<>();
        List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery()
                .processDefinitionId("test2:1:bdcff597-68a1-11ee-af2b-48a47209a1e7")
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

            // 获得流程的所有任务
            List<Object> allTask = new ArrayList<>();
            List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstance.getProcessInstanceId()).list();
            for (Task task1 : tasks) {
                Map<String, Object> taskInfo = new HashMap<>();
                taskInfo.put("taskId", task1.getId());
                taskInfo.put("taskName", task1.getName());
                taskInfo.put("assignee", task1.getAssignee());
                taskInfo.put("claimTime", task1.getClaimTime());
                allTask.add(taskInfo);
            }
            taskMap.put("allTask", allTask);

            // 获得当前流程所属合同名称
            String contractId = flowService.selectByInstanceId(processInstance.getId());
            Contract contract = contractService.findContractById(Integer.valueOf(contractId));
            taskMap.put("contractName", contract.getContractName());

            taskMap.put("flag","进行中");

            list.add(taskMap);
        }
        return list;
    }

    private List<Object> searchAllTaskByDefinitionId(){
        List<Object> allTask = new ArrayList<>();

        List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery()
                .processDefinitionId("test2:1:bdcff597-68a1-11ee-af2b-48a47209a1e7")
                .list();

        for (HistoricTaskInstance historicTask : historicTasks) {
            Task task = taskService.newTask(historicTask.getId());
            task.setName(historicTask.getName());
            task.setAssignee(historicTask.getAssignee());

            TaskDTO taskDTO = new TaskDTO();
            BeanUtils.copyProperties(task,taskDTO);

            Map<String, Object> taskInfo = new HashMap<>();
//            taskInfo.put("taskId", taskDTO.getId());
            taskInfo.put("taskName", taskDTO.getName());
            taskInfo.put("assignee", taskDTO.getAssignee());
            allTask.add(taskInfo);
        }

        return allTask;
    }
}
