package org.huang.dlyk_server.util;

import java.util.function.Consumer;
import java.util.function.Supplier;

public class CacheUtils {
    
    public static <T> T getCacheData(Supplier<T> cacheSelector, Supplier<T> databaseSelector,
                                     Consumer<T> cacheSave){
        // 从缓存中获取数据 / redis
        T cacheData = cacheSelector.get();
        // 如果缓存中有数据，直接返回
        if (cacheData != null){
            return cacheData;
        }
        // 如果缓存中没有数据，从数据库中获取数据
        T databaseData = databaseSelector.get();
        // 将数据保存到缓存中
        cacheSave.accept(databaseData);
        return databaseData;
    }
}
