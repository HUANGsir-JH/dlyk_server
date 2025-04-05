package org.huang.dlyk_server.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.List;

@Aspect
@Component
public class DataScopeAspect {
    
    @Pointcut("@annotation(org.huang.dlyk_server.commons.DataScope)") // 切点复用
    public void pointCut(){}
    
    @Around("pointCut()")
    public Object process(ProceedingJoinPoint prj) throws Throwable {
        MethodSignature signature = (MethodSignature)prj.getSignature();// 获取方法签名
        DataScope annotation = signature.getMethod().getAnnotation(DataScope.class);// 获取注解
        String tableAlias = annotation.tableAlias();
        String tableField = annotation.tableField();
        
        // 获取当前用户的个人信息
        SecurityContext securityContext = SecurityContextHolder.getContext();
        TUser currentUser = (TUser) securityContext.getAuthentication().getPrincipal();
        
        // 获取当前用户的数据权限
        List<String> roles = currentUser.getRoleList();
        
        if(!roles.contains("admin")){
            Object arg = prj.getArgs()[0]; // 取第一个参数
            if(arg instanceof SqlFilter sqlFilter){
                String filterSql;
                filterSql = " and " + tableAlias + "." + tableField + " = " + currentUser.getId();
                sqlFilter.setFilterSql(filterSql);
                prj.getArgs()[0] = sqlFilter;
            }
        }
        
        return prj.proceed();
    }
}
