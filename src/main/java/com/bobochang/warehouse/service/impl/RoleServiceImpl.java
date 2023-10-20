package com.bobochang.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bobochang.warehouse.domain.Role;
import com.bobochang.warehouse.service.RoleService;
import com.bobochang.warehouse.mapper.RoleMapper;
import org.springframework.stereotype.Service;

/**
* @author magic'book
* @description 针对表【role(角色表)】的数据库操作Service实现
* @createDate 2023-10-19 17:22:39
*/
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role>
    implements RoleService{

}




