package cn.dissing.authserver.dao;

import cn.dissing.authserver.domain.SysUser;
import cn.dissing.authserver.domain.SysUserRoles;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by lilongyun on 2018/4/30.
 */
@Mapper
public interface SysUserDao{
    SysUser findOneWithRolesByUsername(String username);

    int saveUser(SysUser sysUser);

    int updateUser(SysUser sysUser);

    int saveUserRoles(SysUserRoles sysUserRoles);

    String findUserNameById(Integer id);
}
