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
import org.huang.dlyk_server.util.ResponseUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * 登录成功处理类
 */
@Component
public class TheLogoutSuccessHandler implements LogoutSuccessHandler {
    @Resource
    private RedisService redisService;
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // 获取用户信息
        TUser user = (TUser) authentication.getPrincipal();
        // 删除redis中的token
        redisService.removeValue(Constant.REDIS_JWT_KEY_PREFIX+user.getId());
        
        R result = R.OK(200, "退出成功");
        String resJson = JSONUtils.toJSON(result);
        ResponseUtils.write(response, resJson);
    }

}
