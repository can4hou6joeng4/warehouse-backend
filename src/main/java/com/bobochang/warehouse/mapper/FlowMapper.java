package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.Flow;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper //如果不在 dao 层增加 @Mapper 注解，就在启动类增加扫描 dao 层的包
public interface FlowMapper {

    /**
     * 根据用户名查询
     * @param username
     * @return
     */
//    FlowInfo getByUsername(String username);

    /**
     * 查询所有流程
     * @return
     */

    //根据流程id查询
//    FlowInfo findOneFlow(Integer id);

//    Integer addDeployState(Flow flow);

    //更新部署状态
//    void updateDeployState(Integer id);

    void insertFlow(Flow flow);

    void updateFlow(Flow flow);

    Flow selectByInstanceId(String instanceId);
}