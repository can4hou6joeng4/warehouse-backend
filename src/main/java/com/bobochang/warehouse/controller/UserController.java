package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.Auth;
import com.bobochang.warehouse.entity.CurrentUser;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.service.AuthService;
import com.bobochang.warehouse.utils.TokenUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 2023/7/12 - 10:43
 *
 * @author bobochang
 * @description
 */
@RequestMapping("/user")
@RestController
public class UserController {

    @Resource
    private AuthService authService;
    @Resource
    private TokenUtils tokenUtils;

    /**
     * 加载当前登录用户权限(菜单)树的url接口/user/auth-list
     *
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken
     * 将请求头Token的值即前端归还的token,赋值给请求处理方法的参数String clientToken
     */
    @GetMapping("/auth-list")
    public Result authList(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken) {
        //从前端归还的token中解析出当前登录用户的信息
        CurrentUser currentUser = tokenUtils.getCurrentUser(clientToken);
        //根据用户id查询用户权限(菜单)树
        List<Auth> authTreeList = authService.findAuthTree(currentUser.getUserId());
        //响应
        return Result.ok(authTreeList);
    }
}
