package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.entity.Role;

import java.util.List;

public interface RoleMapper {

    //查询状态正常的所有角色的方法
    public List<Role> findAllRole();

    //根据用户id查询用户已分配的角色
    public List<Role> findRolesByUserId(Integer userId);

    //根据用户id删除给用户已分配的所有角色
    public int delRoleByUserId(Integer userId);

    //根据角色名称查询角色id
    public int getRoleIdByName(String roleName);

    //添加用户角色关系的方法
    public void insertUserRole(Integer userId, Integer roleId);

}