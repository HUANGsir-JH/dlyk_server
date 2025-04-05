package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.manager.StatisticManager;
import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SummaryDataQuery;
import org.huang.dlyk_server.service.StatisticService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticServiceImpl implements StatisticService {
    @Resource
    private StatisticManager statisticManager;
    
    @Override
    public SummaryDataQuery getSummaryData() {
        return statisticManager.getSummaryData();
    }
    
    @Override
    public List<ChartDataQuery> getSaleFunnelData() {
        return statisticManager.getSaleFunnelData();
    }
    
    @Override
    public List<ChartDataQuery> getCluePieData() {
        return statisticManager.getCluePieData();
    }
    
    @Override
    public List<ChartDataQuery> getActivityBarData(Integer year) {
        return statisticManager.getActivityBarData(year);
    }
}
