package com.bobochang.warehouse.controller;

import com.bobochang.warehouse.annotation.BusLog;
import com.bobochang.warehouse.constants.WarehouseConstants;
import com.bobochang.warehouse.entity.CurrentUser;
import com.bobochang.warehouse.entity.LoginUser;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.entity.User;
import com.bobochang.warehouse.service.UserService;
import com.bobochang.warehouse.utils.DigestUtil;
import com.bobochang.warehouse.utils.TokenUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@Slf4j
@BusLog(name = "登录管理")
public class LoginController {

    //注入UserService
    @Autowired
    private UserService userService;

    //注入redis模板
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    //注入TokenUtils
    @Autowired
    private TokenUtils tokenUtils;

    /**
     * 登录的url接口/login
     */
    @PostMapping("/login")
    @BusLog(descrip = "用户登录")
    public Result login(@RequestBody LoginUser loginUser) {
		/*
		  校验验证码：
		 */
        if (!stringRedisTemplate.hasKey(loginUser.getVerificationCode())) {
            return Result.err(Result.CODE_ERR_BUSINESS, "验证码不正确！");
        }

		/*
		  校验用户名密码:
		 */
        //根据用户名查询用户
        User user = userService.findUserByCode(loginUser.getUserCode());
        if (user != null) {//查到了用户
            if (user.getUserState().equals(WarehouseConstants.USER_STATE_PASS)) {//查到的用户状态是已审核
                //将用户录入的密码进行加密
                String password = DigestUtil.hmacSign(loginUser.getUserPwd());
                if (password.equals(user.getUserPwd())) {//查到的用户的密码和用户录入的密码相同
                    //生成token并响应给前端
                    CurrentUser currentUser = new CurrentUser(user.getUserId(), user.getUserCode(), user.getUserName());
                    String token = tokenUtils.loginSign(currentUser, user.getUserPwd());
                    log.info("用户：" + currentUser.getUserName() + "登录成功");
                    return Result.ok("登录成功！", token);
                } else {//查到的用户的密码和用户录入的密码不同
                    return Result.err(Result.CODE_ERR_BUSINESS, "密码不正确！");
                }
            } else {//查到的用户状态是未审核
                return Result.err(Result.CODE_ERR_BUSINESS, "用户未审核！");
            }
        } else {//没有查到用户
            return Result.err(Result.CODE_ERR_BUSINESS, "该用户不存在！");
        }
    }

    /**
     * 获取当前登录用户信息的url接口/curr-user
     *
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken
     * 将请求头Token的值即前端归还的token,赋值给请求处理方法的参数String clientToken
     */
    @GetMapping("/curr-user")
    public Result currUser(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken) {
        //从前端归还的token中解析出当前登录用户的信息
        CurrentUser currentUser = tokenUtils.getCurrentUser(clientToken);
        return Result.ok(currentUser);
    }

    /**
     * 登出的url接口/logout
     *
     * @RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken
     * 将请求头Token的值即前端归还的token,赋值给请求处理方法的参数String clientToken
     */
    @DeleteMapping("/logout")
    @BusLog(descrip = "用户注销")
    public Result logout(@RequestHeader(WarehouseConstants.HEADER_TOKEN_NAME) String clientToken) {
        String operPerson = tokenUtils.getCurrentUser(clientToken).getUserName();
        return performLogout(operPerson, clientToken);
    }

    private Result performLogout(String operPerson, String clientToken) {
        //从redis移除token
        stringRedisTemplate.delete(clientToken);
        log.info("用户：" + tokenUtils.getCurrentUser(clientToken).getUserName() + "退出系统");
        return Result.ok();
    }

    /**
     * 用于微信小程序的登录接口 /wx-login
     *
     * @param loginUser
     * @return
     */
    @PostMapping("/wx-login")
    public Result WxLogin(@RequestBody LoginUser loginUser) {
		/*
		  校验用户名密码:
		 */
        //根据用户名查询用户
        User user = userService.findUserByCode(loginUser.getUserCode());
        if (user != null) {//查到了用户
            if (user.getUserState().equals(WarehouseConstants.USER_STATE_PASS)) {//查到的用户状态是已审核
                //将用户录入的密码进行加密
                String password = DigestUtil.hmacSign(loginUser.getUserPwd());
                if (password.equals(user.getUserPwd())) {//查到的用户的密码和用户录入的密码相同
                    //生成token并响应给前端
                    CurrentUser currentUser = new CurrentUser(user.getUserId(), user.getUserCode(), user.getUserName());
                    String token = tokenUtils.loginSign(currentUser, user.getUserPwd());
                    return Result.ok("登录成功！", token);
                } else {//查到的用户的密码和用户录入的密码不同
                    return Result.err(Result.CODE_ERR_BUSINESS, "密码不正确！");
                }
            } else {//查到的用户状态是未审核
                return Result.err(Result.CODE_ERR_BUSINESS, "用户未审核！");
            }
        } else {//没有查到用户
            return Result.err(Result.CODE_ERR_BUSINESS, "该用户不存在！");
        }
    }

}