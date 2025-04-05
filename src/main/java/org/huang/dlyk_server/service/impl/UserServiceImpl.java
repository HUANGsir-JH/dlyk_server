package org.huang.dlyk_server.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.manager.RedisManager;
import org.huang.dlyk_server.mapper.TPermissionMapper;
import org.huang.dlyk_server.mapper.TRoleMapper;
import org.huang.dlyk_server.mapper.TUserMapper;
import org.huang.dlyk_server.model.TPermission;
import org.huang.dlyk_server.model.TRole;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.EditUserQuery;
import org.huang.dlyk_server.query.OwnerQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.query.UserQuery;
import org.huang.dlyk_server.service.UserService;
import org.huang.dlyk_server.util.CacheUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private TUserMapper userMapper;
    @Resource
    private PasswordEncoder passwordEncoder;
    @Resource
    private TRoleMapper roleMapper;
    @Resource
    private RedisManager redisManager;
    @Resource
    private TPermissionMapper permissionMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TUser user=userMapper.selectByLoginAct(username);
        if(user==null){
            throw new UsernameNotFoundException("用户不存在");
        }
        // 用户角色
        List<TRole> roleList = roleMapper.selectRoleByUserId(user.getId());
        List<String> stringRoleList = new ArrayList<>();
        roleList.forEach(role-> stringRoleList.add(role.getRole()));
        user.setRoleList(stringRoleList);
        // 用户菜单权限
        List<TPermission> menuPermissionList = permissionMapper.selectMenuPermissionByUserId(user.getId());
        user.setMenuPermissionList(menuPermissionList);
        // 用户操作权限
        List <TPermission> buttonPermissionList = permissionMapper.selectButtonPermissionByUserId(user.getId());
        List<String> stringButtonPermissionList = new ArrayList<>();
        buttonPermissionList.forEach(permission-> stringButtonPermissionList.add(permission.getCode()));
        user.setPermissionList(stringButtonPermissionList);
        return user;
    }
    
    @Override
    public PageInfo<TUser> getUsersByPage(Integer current) {
        PageHelper.startPage(current, Constant.PAGE_SIZE);
        List<TUser> users = userMapper.selectUserByPage(SqlFilter.builder().build());
        // 清除密码
        users.forEach(user -> user.setLoginPwd(null));
        return new PageInfo<>(users);
    }
    
    @Override
    public TUser loadUserById(Integer id) {
        TUser user = userMapper.selectByPrimaryKey(id);
        user.setLoginPwd(null);
        return user;
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addUser(UserQuery userQuery) {
        TUser user = new TUser();
        // 复制属性,忽略null值，需要注意的是，复制属性时，如果属性名不一致，是不会复制的
        BeanUtils.copyProperties(userQuery, user);
        // 密码加密
        user.setLoginPwd(passwordEncoder.encode(userQuery.getLoginPwd()));
        user.setCreateTime(new Date());
        // 从安全上下文中获取当前用户
        TUser currentUser = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        user.setCreateBy(currentUser.getId());
        return userMapper.insertSelective(user);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateUser(EditUserQuery userQuery) {
        TUser user = new TUser();
        BeanUtils.copyProperties(userQuery, user);
        // 设置编辑时间和编辑人
        user.setEditTime(new Date());
        TUser currentUser = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        user.setEditBy(currentUser.getId());
        return userMapper.updateByPrimaryKeySelective(user);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteUsers(List<String> idList) {
        int successLen = 0;
        for (String id : idList) {
            int i = userMapper.deleteByPrimaryKey(Integer.parseInt(id));
            if (i >= 1) {
                successLen++;
            }
        }
        return successLen;
    }
    
    @Override
    public List<OwnerQuery> getOwner() {
        List<OwnerQuery> ownerList = new ArrayList<>();
        ownerList=userMapper.selectOwners(SqlFilter.builder().build());
        return ownerList;
//        return (List<OwnerQuery>) CacheUtils.getCacheData(()->{
//            return redisManager.getOwners(Constant.REDIS_OWNER_KEYS);
//        }, ()->{
//            return userMapper.selectOwners(SqlFilter.builder().build());
//        }, (t)->{
//            redisManager.saveOwners(Constant.REDIS_OWNER_KEYS, (List<OwnerQuery>) t);
//        });
    }
}
