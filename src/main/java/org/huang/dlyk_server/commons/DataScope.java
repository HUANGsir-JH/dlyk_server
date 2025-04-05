package org.huang.dlyk_server.commons;

import java.lang.annotation.*;

// 用于数据权限校验
@Target({ElementType.METHOD}) // 作用于方法
@Retention(RetentionPolicy.RUNTIME) // 运行时注解
@Documented // 说明该注解将被包含在javadoc中
public @interface DataScope {
    String tableAlias() default ""; // 表别名
    String tableField() default ""; // 表字段
}
