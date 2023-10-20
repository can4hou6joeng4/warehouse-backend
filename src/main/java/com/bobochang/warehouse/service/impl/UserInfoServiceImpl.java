package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.UserInfo;
import com.bobochang.warehouse.entity.Result;
import com.bobochang.warehouse.page.Page;
import com.bobochang.warehouse.service.UserInfoService;
import com.bobochang.warehouse.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author magic'book
* @description 针对表【user_info(用户表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo>
    implements UserInfoService{
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public UserInfo findUserByCode(String userCode) {
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_code",userCode);
        return userInfoMapper.selectOne(queryWrapper);
    }

    @Override
    public Page queryUserPage(Page page, UserInfo user) {
        return null;
    }

    @Override
    public Result saveUser(UserInfo user) {
        return null;
    }

    @Override
    public Result updateUserState(UserInfo user) {
        return null;
    }

    @Override
    public int deleteUserById(Integer userId) {
        return 0;
    }

    @Override
    public Result updateUserName(UserInfo user) {
        return null;
    }

    @Override
    public Result resetPwd(Integer userId) {
        return null;
    }

    @Override
    public String searchUserHiredate(int userId) {
        return null;
    }

    @Override
    public Result searchById(int userId) {
        return null;
    }

    @Override
    public String searchRoleCodeById(int userId) {
        return null;
    }
}




