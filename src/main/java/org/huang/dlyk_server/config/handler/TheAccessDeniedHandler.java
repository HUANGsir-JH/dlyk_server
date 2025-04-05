package org.huang.dlyk_server.config.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.huang.dlyk_server.result.CodeEnum;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.util.JSONUtils;
import org.huang.dlyk_server.util.ResponseUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class TheAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        // 权限不足
        R result = R.FAIL(CodeEnum.ACCESS_DENIED.getCode(), CodeEnum.ACCESS_DENIED.getMsg());
        String resultJson = JSONUtils.toJSON(result);
        ResponseUtils.write(response, resultJson);
    }
}
