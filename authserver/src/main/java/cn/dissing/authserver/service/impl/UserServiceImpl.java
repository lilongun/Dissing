package cn.dissing.authserver.service.impl;

import cn.dissing.authserver.dao.SysUserDao;
import cn.dissing.authserver.domain.SysUser;
import cn.dissing.authserver.domain.SysUserRoles;
import cn.dissing.authserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lilongyun on 2018/9/18.
 */
@Service("userService")
public class UserServiceImpl implements UserService{
    @Autowired
    private SysUserDao sysUserDao;

    @Override
    @Transactional
    public int saveUser(SysUser sysUser) {
        int result = sysUserDao.saveUser(sysUser);
        if( result > 0 ){
            SysUserRoles sysUserRoles = new SysUserRoles();
            sysUserRoles.setUserId(sysUser.getId());
            sysUserRoles.setRolesId(4);
            result = sysUserDao.saveUserRoles(sysUserRoles);
        }
        return result;
    }

    @Override
    @Transactional
    public int updateUser(SysUser sysUser) {
        return sysUserDao.updateUser(sysUser);
    }

    @Override
    public SysUser findOneWithRolesByUsername(String userName) {
        return sysUserDao.findOneWithRolesByUsername(userName);
    }
}
