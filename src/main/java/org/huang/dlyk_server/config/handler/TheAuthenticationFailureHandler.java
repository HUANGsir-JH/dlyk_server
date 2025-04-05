package org.huang.dlyk_server.config.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.util.JSONUtils;
import org.huang.dlyk_server.util.ResponseUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class TheAuthenticationFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        // 登录失败后返回错误信息
        R result = R.FAIL(401,exception.getMessage());
        // 将错误信息返回给前端json格式
        String resultJson = JSONUtils.toJSON(result);
        response.setStatus(401);
        ResponseUtils.write(response, resultJson);
    }
}
