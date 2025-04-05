package org.huang.dlyk_server.config.handler;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.RedisService;
import org.huang.dlyk_server.util.JSONUtils;
import org.huang.dlyk_server.util.JWTUtils;
import org.huang.dlyk_server.util.ResponseUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Component
public class TheAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Resource
    private RedisService redisService;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // 从authentication中获取用户信息
        TUser user = (TUser) authentication.getPrincipal();
        user.setLoginPwd(null);
        // 转换为json
        String userJson=JSONUtils.toJSON(user);
        String token = JWTUtils.createJWT(userJson);
        
        // 把token存到redis
        redisService.setValue(Constant.REDIS_JWT_KEY_PREFIX +user.getId(), token);
        // 设置过期时间
        String isRemember = request.getParameter("remember");
        if(isRemember.equals("1")){
            redisService.expire(Constant.REDIS_JWT_KEY_PREFIX+user.getId(),
                    Constant.EXPIRE_TIME_REMEMBER, TimeUnit.SECONDS);
        }else{
            redisService.expire(Constant.REDIS_JWT_KEY_PREFIX+user.getId(),
                    Constant.EXPIRE_TIME_NOT_REMEMBER, TimeUnit.SECONDS);
        }
        user.setLastLoginTime(new Date());
        // 登录成功后返回jwt
        R result = R.OK(token);
        // 将用户信息返回给前端json格式
        String resultJson = JSONUtils.toJSON(result);
        ResponseUtils.write(response, resultJson);
    }
}
