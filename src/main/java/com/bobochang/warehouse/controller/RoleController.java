package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.entity.Role;
import com.bobochang.warehouse.service.AuthService;
import com.bobochang.warehouse.service.RoleService;
import com.bobochang.warehouse.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RequestMapping("/role")
@RestController
public class RoleController {

    @Resource
    private RoleService roleService;

    /**
     * 查询所有角色的url接口role/role-list
     */
    @GetMapping("/role-list")
    public Result queryAllRole() {
        //执行业务
        List<Role> roleList = roleService.getAllRole();
        //响应
        return Result.ok(roleList);
    }
}
