package org.huang.dlyk_server.constant;

public class Constant {
    
    public static final String LOGIN_URL = "/api/login";
    
    public static final String LOGOUT_URL = "/api/logout";
    
    public static final String REDIS_JWT_KEY_PREFIX = "dlyk:user:login:";
    
    public static final String REDIS_OWNER_KEYS = "dlyk:user:owner";
    
    public static final long EXPIRE_TIME_NOT_REMEMBER = 30 * 60; // 30分钟
    
    public static final long EXPIRE_TIME_REMEMBER = 60 * 60 * 24 * 7; // 七天
    
    public static final String SECRET = "dlyk20250318";  // jwt密钥
    
    public static final int  PAGE_SIZE = 10;
    
    public static final int PRODUCT_PAGE_SIZE = 4; // 产品列表每页显示的数量
    
}
