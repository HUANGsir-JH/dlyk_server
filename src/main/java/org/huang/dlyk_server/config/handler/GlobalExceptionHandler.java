package org.huang.dlyk_server.config.handler;

import org.huang.dlyk_server.result.R;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

// 全局异常处理
@RestControllerAdvice
public class GlobalExceptionHandler {
    
    

    @ExceptionHandler(DataAccessException.class) // 数据库异常
    public R handleDataAccessException(DataAccessException e) {
        e.printStackTrace();
        return R.builder().code(500).msg("数据库操作失败").build();
    }
}
