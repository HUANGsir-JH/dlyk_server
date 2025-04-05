package org.huang.dlyk_server.config.filter;

import jakarta.annotation.Resource;
import jakarta.servlet.FilterChain;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Component
public class TokenVerifyFilter extends OncePerRequestFilter {
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Resource
    private RedisService redisService;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if(request.getRequestURI().equals("/api/login")) {
            // 如果是登录请求，直接放行
            filterChain.doFilter(request, response);
        }
        String token = null;
        if(request.getRequestURI().equals("/api/exportExcel")) {
             token = request.getParameter("Authorization");
        }else{
            token = request.getHeader("Authorization");
        }
        
        if(token == null || token.isEmpty()) {
            R result =  R.builder().code(401).msg("认证失败，请登录").build();
            String resultJSON = JSONUtils.toJSON(result);
            ResponseUtils.write(response,resultJSON);
            return;
        }
        
        TUser user = JWTUtils.parseUserFormJWT(token);
        String redisToken = redisTemplate.opsForValue().get(Constant.REDIS_JWT_KEY_PREFIX+user.getId());
        boolean isVerify = JWTUtils.verifyJWT(token);
        if(redisToken==null || !redisToken.equals(token) || !isVerify) {
            R result =  R.builder().code(401).msg("认证失败，请登录").build();
            String resultJSON = JSONUtils.toJSON(result);
            ResponseUtils.write(response,resultJSON);
            return;
        }
        
        // 验证通过,在SpringSecurity的上下文中设置用户信息
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        
        // token续期
        String isRemember = request.getHeader("remember");
        new Thread(()->{
            if("1".equals(isRemember)){
                redisService.expire(Constant.REDIS_JWT_KEY_PREFIX+user.getId(),
                        Constant.EXPIRE_TIME_REMEMBER, TimeUnit.SECONDS);
            }else{
                redisService.expire(Constant.REDIS_JWT_KEY_PREFIX+user.getId(),
                        Constant.EXPIRE_TIME_NOT_REMEMBER, TimeUnit.SECONDS);
            }
        }).start();
        
        filterChain.doFilter(request, response);
    }
}
