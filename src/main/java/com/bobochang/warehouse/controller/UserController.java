package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.dto.AssignRoleDto;
import com.bobochang.warehouse.entity.*;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.service.AuthService;
import com.bobochang.warehouse.service.RoleService;
import com.bobochang.warehouse.service.UserService;
import com.bobochang.warehouse.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
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
    private UserService userService;
    @Resource
    private RoleService roleService;
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

    @GetMapping("/user-list")
    public Result userListPage(Page page, User user) {
        //执行业务
        page = userService.queryUserPage(page, user);
        //响应
        return Result.ok(page);
    }


    /**
     * 添加用户的url接口/user/addUser
     *
     * @RequestBody User user将添加的用户信息的json串数据封装到参数User对象;
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token
     * 将请求头Token的值即客户端归还的token赋值给参数变量token;
     */
    @PostMapping("/addUser")
    public Result addUser(@RequestBody User user,
                          @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token) {
        //获取当前登录的用户
        CurrentUser currentUser = tokenUtils.getCurrentUser(token);
        //获取当前登录的用户id,即创建新用户的用户id
        int createBy = currentUser.getUserId();
        user.setCreateBy(createBy);
        //执行业务
        Result result = userService.saveUser(user);
        return result;
    }

    /**
     * 修改用户状态的url接口/user/updateState
     *
     * @RequestBody User user将客户端传递的json数据封装到参数User对象中;
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token
     * 将请求头Token的值即客户端归还的token赋值给参数变量token;
     */
    @PutMapping("/updateState")
    public Result updateUserState(@RequestBody User user,
                                  @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token) {
        //获取当前登录的用户
        CurrentUser currentUser = tokenUtils.getCurrentUser(token);
        //获取当前登录的用户id,即修改用户的用户id
        int updateBy = currentUser.getUserId();

        //设置修改用户的用户id和修改时间
        user.setUpdateBy(updateBy);
        user.setUpdateTime(new Date());

        //执行业务
        Result result = userService.updateUserState(user);

        //响应
        return result;
    }

    /**
     * 删除用户的url接口/user/deleteUser/{userId}
     */
    @DeleteMapping("/deleteUser/{userId}")
    public Result deleteUser(@PathVariable Integer userId) {
        //执行业务
        userService.deleteUserById(userId);
        //响应
        return Result.ok("用户删除成功！");
    }

    /**
     * 修改用户的url接口/user/updateUser
     *
     * @RequestBody User user将请求传递的json数据封装到参数User对象;
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token
     * 将请求头Token的值即客户端归还的token赋值给参数变量token;
     */
    @PutMapping("/updateUser")
    public Result updateUser(@RequestBody User user,
                             @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String token) {
        //获取当前登录的用户
        CurrentUser currentUser = tokenUtils.getCurrentUser(token);
        //获取当前登录的用户id -- 修改用户的用户id
        int updateBy = currentUser.getUserId();

        user.setUpdateBy(updateBy);

        //执行业务
        Result result = userService.updateUserName(user);

        //响应
        return result;
    }

    /**
     * 重置密码的url接口/user/updatePwd/{userId}
     */
    @PutMapping("/updatePwd/{userId}")
    public Result resetPassWord(@PathVariable Integer userId) {
        //执行业务
        Result result = userService.resetPwd(userId);
        //响应
        return result;
    }

    /**
     * 查询用户已分配的角色的url接口/user/user-role-list/{userId}
     */
    @GetMapping("/user-role-list/{userId}")
    public Result userRoleList(@PathVariable Integer userId) {
        //执行业务
        List<Role> roleList = roleService.queryRolesByUserId(userId);
        //响应
        return Result.ok(roleList);
    }

    /**
     * 给用户分配角色的url接口/user/assignRole
     *
     * @RequestBody AssignRoleDto assignRoleDto将请求传递的json数据
     * 封装到参数AssignRoleDto对象中;
     */
    @RequestMapping("/assignRole")
    public Result assignRole(@RequestBody AssignRoleDto assignRoleDto){
        //执行业务
        roleService.assignRole(assignRoleDto);
        //响应
        return Result.ok("分配角色成功！");
    }


}