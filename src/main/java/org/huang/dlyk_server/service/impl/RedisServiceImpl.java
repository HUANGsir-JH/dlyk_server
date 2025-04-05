package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Override
    public void setValue(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }
    
    @Override
    public Object getValue(String key) {
        return redisTemplate.opsForValue().get(key);
    }
    
    @Override
    public boolean removeValue(String key) {
        return redisTemplate.delete(key);
    }
    
    @Override
    public boolean expire(String key, long time, TimeUnit timeUnit) {
        return redisTemplate.expire(key, time, timeUnit);
    }
}
