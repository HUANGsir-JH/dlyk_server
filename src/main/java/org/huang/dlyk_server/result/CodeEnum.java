package org.huang.dlyk_server.result;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CodeEnum {
    
    OK(200,"成功"),
    FAIL(400,"失败"),
    ACCESS_DENIED(403,"没有权限");
    
    private final int code;
    private final String msg;
}
