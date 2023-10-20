package com.bobochang.warehouse.mapper;

import com.bobochang.warehouse.domain.AuthInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author magic'book
* @description 针对表【auth_info(权限表)】的数据库操作Mapper
* @createDate 2023-10-19 17:22:38
* @Entity generator.domain.AuthInfo
*/
public interface AuthInfoMapper extends BaseMapper<AuthInfo> {
    //根据用户id查询用户所有权限(菜单)的方法
    public List<AuthInfo> findAllAuth(int userId);
}




