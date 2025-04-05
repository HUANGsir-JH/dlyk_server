package org.huang.dlyk_server.manager;

import org.huang.dlyk_server.query.OwnerQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

// 毫无意义
@Component
public class RedisManager {

    @Autowired
    private StringRedisTemplate redisTemplate;
    public Object getOwners(String key){
        // 使用redis的list数据结构
        return  redisTemplate.opsForList().range(key, 0, -1);
    }
    
    public void saveOwners(String key, List<OwnerQuery> ownerQueries){
        // 使用redis的list数据结构
        redisTemplate.opsForList().rightPushAll(key, String.valueOf(ownerQueries));
    }
}
