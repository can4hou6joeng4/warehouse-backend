package com.bobochang.warehouse.service;

import com.bobochang.warehouse.domain.UserInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;

/**
* @author magic'book
* @description 针对表【user_info(用户表)】的数据库操作Service
* @createDate 2023-10-19 17:22:39
*/
public interface UserInfoService extends IService<UserInfo> {
    UserInfo findUserByCode(String userCode);

    public Page queryUserPage(Page page, UserInfo user);

    //添加用户的业务方法
    public Result saveUser(UserInfo user);

    //修改用户状态的业务方法
    public Result updateUserState(UserInfo user);

    //根据用户id删除用户的业务方法
    public int deleteUserById(Integer userId);

    //修改用户昵称的业务方法
    public Result updateUserName(UserInfo user);

    //重置密码的业务方法
    public Result resetPwd(Integer userId);

    // 查询用户的创建日期
    String searchUserHiredate(int userId);

    Result searchById(int userId);

    String searchRoleCodeById(int userId);
}
