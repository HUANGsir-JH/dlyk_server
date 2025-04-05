package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.EditUserQuery;
import org.huang.dlyk_server.query.OwnerQuery;
import org.huang.dlyk_server.query.UserQuery;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    PageInfo<TUser> getUsersByPage(Integer current);
    TUser loadUserById(Integer id);
    int addUser(UserQuery userQuery);
    
    int updateUser(EditUserQuery userQuery);
    
    int deleteUser(Integer id);
    
    int deleteUsers(List<String> idList);
    
    List<OwnerQuery> getOwner();
}
