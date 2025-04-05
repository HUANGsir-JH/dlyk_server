package org.huang.dlyk_server.tasks;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.DlykServerApplication;
import org.huang.dlyk_server.constant.DicEnum;
import org.huang.dlyk_server.model.TDicType;
import org.huang.dlyk_server.model.TDicValue;
import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.service.TDicTypeService;
import org.huang.dlyk_server.service.TDicValueService;
import org.huang.dlyk_server.service.TProductService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@EnableScheduling
public class DataTask {
    @Resource
    private TProductService tProductService;
    
    @Resource
    private TDicTypeService tDicTypeService;
    
    @Scheduled(cron ="${dlyk.task.interval}")
    public void executeTask() {
        loadDictionaryData();
    }
    
    @PostConstruct // 在Spring容器初始化后执行
    public void init() {
        loadDictionaryData();
    }
    
    private void loadDictionaryData() {
        // 执行定时任务的逻辑，获取字典数据
        List<TDicType> dicTypes = tDicTypeService.getAllDicType();
        
        // 将字典类型存入缓存
        dicTypes.forEach(dicType -> {
            String typeCode = dicType.getTypeCode();
            List<TDicValue> dicValues = dicType.getDicValues();
            // 将字典值存入缓存
            DlykServerApplication.CACHE.put(typeCode, dicValues);
        });
        
        // 获取在售产品列表
        List<TProduct> productList = tProductService.getAllOnSaleProduct();
        // 将在售产品列表存入缓存
        DlykServerApplication.CACHE.put(DicEnum.INTENTIONPRODUCT.getTypeCode(), productList);
    }
}
