package com.bobochang.warehouse.service;

import com.bobochang.warehouse.dto.AssignAuthDto;
import com.bobochang.warehouse.entity.Auth;

import java.util.List;

/**
 * 2023/7/12 - 11:12
 *
 * @author bobochang
 * @description
 */
public interface AuthService {

    //根据用户id查询用户权限(菜单)树的业务方法
    public List<Auth> findAuthTree(Integer userId);

    //查询整个权限(菜单)树的业务方法
    public List<Auth> allAuthTree();

    //给角色分配权限(菜单)的业务方法
    public void assignAuth(AssignAuthDto assignAuthDto);
}
