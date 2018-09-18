package cn.dissing.authserver.service;

import cn.dissing.authserver.domain.SysUser;
import cn.dissing.authserver.domain.SysUserRoles;

import java.util.List;

/**
 * Created by lilongyun on 2018/9/18.
 */
public interface UserService {
    int saveUser(SysUser sysUser);

    int updateUser(SysUser sysUser);

    SysUser findOneWithRolesByUsername(String userName);
}
