package com.bobochang.warehouse.service;

import com.bobochang.warehouse.dto.AssignRoleDto;
import com.bobochang.warehouse.entity.Role;

import java.util.List;

public interface RoleService {

    //查询所有角色的业务方法
    public List<Role> getAllRole();

    //查询用户已分配的角色的业务方法
    public List<Role> queryRolesByUserId(Integer userId);

    //给用户分配角色的业务方法
    public void assignRole(AssignRoleDto assignRoleDto);
}