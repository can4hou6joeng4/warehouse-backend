package com.bobochang.warehouse.service.impl;

import com.bobochang.warehouse.dto.AssignRoleDto;
import com.bobochang.warehouse.entity.Role;
import com.bobochang.warehouse.mapper.RoleMapper;
import com.bobochang.warehouse.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {


    @Resource
    private RoleMapper roleMapper;


    //查询所有角色的业务方法
    @Override
    public List<Role> getAllRole() {
        //查询状态正常的所有角色
        return roleMapper.findAllRole();
    }

    //查询用户已分配的角色的业务方法
    @Override
    public List<Role> queryRolesByUserId(Integer userId) {
        return roleMapper.findRolesByUserId(userId);
    }

    //给用户分配角色的业务方法
    @Transactional//事务处理
    @Override
    public void assignRole(AssignRoleDto assignRoleDto) {

        //拿到用户id
        Integer userId = assignRoleDto.getUserId();
        //拿到给用户分配的所有角色名
        List<String> roleNameList = assignRoleDto.getRoleCheckList();

        //根据用户id删除给用户已分配的所有角色
        roleMapper.delRoleByUserId(userId);

        //循环添加用户角色关系
        for (String roleName : roleNameList) {
            //根据当前角色名查询当前角色的id
            int roleId = roleMapper.getRoleIdByName(roleName);
            //添加用户角色关系
            roleMapper.insertUserRole(userId, roleId);
        }
    }
}
