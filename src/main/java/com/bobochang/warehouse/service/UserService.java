package com.bobochang.warehouse.service;

import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.entity.User;

/**
 * 2023/7/12 - 10:06
 *
 * @author bobochang
 * @description
 */
public interface UserService {

    public User findUserByCode(String userCode);

    public Page queryUserPage(Page page, User user);

    //添加用户的业务方法
    public Result saveUser(User user);

    //修改用户状态的业务方法
    public Result updateUserState(User user);

    //根据用户id删除用户的业务方法
    public int deleteUserById(Integer userId);

    //修改用户昵称的业务方法
    public Result updateUserName(User user);

    //重置密码的业务方法
    public Result resetPwd(Integer userId);

}
