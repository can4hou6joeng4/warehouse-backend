package com.bobochang.warehouse.service.impl;

import com.alibaba.fastjson.JSON;
import com.bobochang.warehouse.entity.Auth;
import com.bobochang.warehouse.mapper.AuthMapper;
import com.bobochang.warehouse.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 2023/7/12 - 11:13
 *
 * @author bobochang
 * @description
 */
@Service
public class AuthServiceImpl implements AuthService {
    @Resource
    private AuthMapper authMapper;

    @Autowired
    private StringRedisTemplate redisTemplate;


    /**
     * 根据用户id查询用户权限(菜单)树的业务方法
     */
    @Override
    public List<Auth> findAuthTree(Integer userId) {
        //先从redis中查询缓存,查到的是权限(菜单)树List<Auth>转的json串
        String authTreeListJson = redisTemplate.opsForValue().get(userId + ":authTree");
        if (StringUtils.hasText(authTreeListJson)) {//redis中查到缓存
            //将json串转回权限(菜单)树List<Auth>并返回
            return JSON.parseArray(authTreeListJson, Auth.class);
        }
        //redis中没有查到缓存,从数据库表中查询所有权限(菜单)
        List<Auth> allAuthList = authMapper.findAllAuth(userId);
        //将所有权限(菜单)List<Auth>转成权限(菜单)树List<Auth>
        List<Auth> authTreeList = allAuthToAuthTree(allAuthList, 0);
        //将权限(菜单)树List<Auth>转成json串并保存到redis
        redisTemplate.opsForValue().set(userId + ":authTree", JSON.toJSONString(authTreeList));
        //返回权限(菜单)树List<Auth>
        return authTreeList;
    }

    //将所有权限(菜单)转成权限(菜单)树的递归算法
    private List<Auth> allAuthToAuthTree(List<Auth> allAuthList, int parentId) {
        //获取父权限(菜单)id为参数parentId的所有权限(菜单)
        //【parentId最初为0,即最初查的是所有一级权限(菜单)】
        List<Auth> authList = new ArrayList<>();
        for (Auth auth : allAuthList) {
            if (auth.getParentId() == parentId) {
                authList.add(auth);
            }
        }
        //查询List<Auth> authList中每个权限(菜单)的所有子级权限(菜单)
        for (Auth auth : authList) {
            List<Auth> childAuthList = allAuthToAuthTree(allAuthList, auth.getAuthId());
            auth.setChildAuth(childAuthList);
        }
        return authList;
    }
}
