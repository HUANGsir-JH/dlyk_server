package org.huang.dlyk_server.config;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.huang.dlyk_server.config.filter.TokenVerifyFilter;
import org.huang.dlyk_server.config.handler.TheAccessDeniedHandler;
import org.huang.dlyk_server.config.handler.TheAuthenticationFailureHandler;
import org.huang.dlyk_server.config.handler.TheAuthenticationSuccessHandler;
import org.huang.dlyk_server.config.handler.TheLogoutSuccessHandler;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.util.JSONUtils;
import org.huang.dlyk_server.util.ResponseUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;


@EnableMethodSecurity
@Configuration
public class SecurityConfig {
    @Resource
    private TheAuthenticationSuccessHandler theAuthenticationSuccessHandler;
    @Resource
    private TheAuthenticationFailureHandler theAuthenticationFailureHandler;
    @Resource
    private TheLogoutSuccessHandler theLogoutSuccessHandler;
    @Resource
    private TheAccessDeniedHandler theAccessDeniedHandler;
    @Resource
    private TokenVerifyFilter tokenVerifyFilter;
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .formLogin((form) ->{
                   form.loginProcessingUrl(Constant.LOGIN_URL)
                           .usernameParameter("username")
                            .passwordParameter("password")
                            .successHandler(theAuthenticationSuccessHandler)
                           .failureHandler(theAuthenticationFailureHandler);
                })
                .logout((logout) ->{
                    logout.logoutUrl(Constant.LOGOUT_URL)
                            .logoutSuccessHandler(theLogoutSuccessHandler);
                })
                .authorizeHttpRequests((authorize) ->{
                    authorize
                            .requestMatchers(Constant.LOGIN_URL).permitAll()
                            .anyRequest().authenticated();
                })
                .csrf(AbstractHttpConfigurer::disable) // 关闭csrf，禁用跨站请求伪造
                .cors((cors) -> cors.configurationSource(corsConfigurationSource()))
                .addFilterBefore(tokenVerifyFilter, LogoutFilter.class)
                // 对于REST API设置无状态会话
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )
                .exceptionHandling(exceptionHandling -> {
                    exceptionHandling.accessDeniedHandler(theAccessDeniedHandler);
                })
                .build();
    }
    
    // 跨域配置
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration(); // 跨域配置
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:5173",
                "http://localhost:5174")); // 允许跨域的域名
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE")); // 允许跨域的方法
        configuration.setAllowedHeaders(Arrays.asList("*")); // 允许跨域的请求头
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**",configuration);
        return source;
    }
}
