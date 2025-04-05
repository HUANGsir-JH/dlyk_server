package org.huang.dlyk_server.service;

import java.util.concurrent.TimeUnit;

public interface RedisService {
    void setValue(String key, String value);
    Object getValue(String key);
    boolean removeValue(String key);
    boolean expire(String key, long time, TimeUnit timeUnit);
}
