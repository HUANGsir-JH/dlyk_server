package org.huang.dlyk_server.service;

import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SummaryDataQuery;

import java.util.List;

public interface StatisticService{
    SummaryDataQuery getSummaryData();
    
    List<ChartDataQuery> getSaleFunnelData();
    
    List<ChartDataQuery> getCluePieData();
    
    List<ChartDataQuery> getActivityBarData(Integer year);
}
