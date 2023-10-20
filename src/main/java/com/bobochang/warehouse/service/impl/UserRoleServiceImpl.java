package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.UserRole;
import com.bobochang.warehouse.service.UserRoleService;
import com.bobochang.warehouse.mapper.UserRoleMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【user_role(用户角色表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole>
    implements UserRoleService{

}




