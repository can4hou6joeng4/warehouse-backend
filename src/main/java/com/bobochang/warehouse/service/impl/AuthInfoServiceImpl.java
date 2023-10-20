package com.bobochang.warehouse.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.AuthInfo;
import com.bobochang.warehouse.service.AuthInfoService;
import com.bobochang.warehouse.mapper.AuthInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
* @author magic'book
* @description 针对表【auth_info(权限表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class AuthInfoServiceImpl extends ServiceImpl<AuthInfoMapper, AuthInfo>
    implements AuthInfoService{
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private AuthInfoMapper authInfoMapper;
    /**
     * 根据用户id查询用户权限(菜单)树的业务方法
     */
    @Override
    public List<AuthInfo> findAuthTree(Integer userId) {
        //先从redis中查询缓存,查到的是权限(菜单)树List<Auth>转的json串
        String authTreeListJson = stringRedisTemplate.opsForValue().get(userId + ":authTree");
        if (StringUtils.hasText(authTreeListJson)) {//redis中查到缓存
            //将json串转回权限(菜单)树List<Auth>并返回
            return JSON.parseArray(authTreeListJson, AuthInfo.class);
        }
        //redis中没有查到缓存,从数据库表中查询所有权限(菜单)
        List<AuthInfo> allAuthList = authInfoMapper.findAllAuth(userId);
        //将所有权限(菜单)List<Auth>转成权限(菜单)树List<Auth>
        List<AuthInfo> authTreeList = allAuthToAuthTree(allAuthList, 0);
        //将权限(菜单)树List<Auth>转成json串并保存到redis
        stringRedisTemplate.opsForValue().set(userId + ":authTree", JSON.toJSONString(authTreeList));
        //返回权限(菜单)树List<Auth>
        return authTreeList;
    }

    //将所有权限(菜单)转成权限(菜单)树的递归算法
    private List<AuthInfo> allAuthToAuthTree(List<AuthInfo> allAuthList, int parentId) {
        //获取父权限(菜单)id为参数parentId的所有权限(菜单)
        //【parentId最初为0,即最初查的是所有一级权限(菜单)】
        List<AuthInfo> authList = new ArrayList<>();
        for (AuthInfo auth : allAuthList) {
            if (auth.getParentId() == parentId) {
                authList.add(auth);
            }
        }
        //查询List<Auth> authList中每个权限(菜单)的所有子级权限(菜单)
        for (AuthInfo auth : authList) {
            List<AuthInfo> childAuthList = allAuthToAuthTree(allAuthList, auth.getAuthId());
            auth.setChildAuth(childAuthList);
        }
        return authList;
    }
}




