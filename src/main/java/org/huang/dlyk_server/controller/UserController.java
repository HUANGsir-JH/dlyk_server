package org.huang.dlyk_server.controller;

import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.EditUserQuery;
import org.huang.dlyk_server.query.OwnerQuery;
import org.huang.dlyk_server.query.UserQuery;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {
    @Resource
    private UserService userService;

    @GetMapping("/api/login/info")
    public R loginInfo(Authentication authentication) {
        TUser user = (TUser) authentication.getPrincipal();
        return R.OK(user);
    }
    
    @GetMapping("/api/login/free")
    public R free() {
        return R.OK("免登录接口");
    }
    
    @PreAuthorize("hasAuthority('user:list') || hasAuthority('user:view')")
    @GetMapping("/api/users")
    public R users(@RequestParam(value="current", defaultValue="1") Integer current){
        PageInfo<TUser> users = userService.getUsersByPage(current);
        return R.OK(users);
    }
    
    @PreAuthorize("hasAuthority('user:list') || hasAuthority('user:view')")
    @GetMapping("/api/user")
    public R user(@RequestParam("id") Integer id) {
        return R.OK(userService.loadUserById(id));
    }
    
    @PreAuthorize("hasAuthority('user:add')")
    @PostMapping("/api/user")
    public R addUser(UserQuery userQuery) {
        int i = userService.addUser(userQuery);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('user:edit')")
    @PutMapping("/api/user")
    public R updateUser(EditUserQuery userQuery) {
        int i = userService.updateUser(userQuery);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('user:delete')")
    @DeleteMapping("/api/user")
    public R deleteUser(@RequestParam("id") Integer id) {
        int i = userService.deleteUser(id);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('user:delete')")
    @DeleteMapping("/api/user/batch")
    public R deleteUsers(@RequestParam("ids") List<String> idList) {
        int len = idList.size();
        int i = userService.deleteUsers(idList);
        return i==len ? R.OK() : R.FAIL();
    }
    
    @GetMapping("/api/owner")
    public R getOwners() {
        List<OwnerQuery> owners = userService.getOwner();
        return !owners.isEmpty() ? R.OK(owners) : R.FAIL();
    }
}
