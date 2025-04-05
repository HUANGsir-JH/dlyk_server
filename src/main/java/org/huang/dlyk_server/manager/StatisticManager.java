package org.huang.dlyk_server.manager;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TActivityMapper;
import org.huang.dlyk_server.mapper.TClueMapper;
import org.huang.dlyk_server.mapper.TCustomerMapper;
import org.huang.dlyk_server.mapper.TTranMapper;
import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SummaryDataQuery;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
public class StatisticManager {
    @Resource
    private TClueMapper clueMapper;
    
    @Resource
    private TActivityMapper activityMapper;
    
    @Resource
    private TCustomerMapper customerMapper;
    
    @Resource
    private TTranMapper tranMapper;
    
    public SummaryDataQuery getSummaryData() {
        Integer effectiveActivityCount = activityMapper.countEffectiveActivity();
        Integer totalActivityCount = activityMapper.countTotalActivity() ;
        Integer totalClueCount = clueMapper.countClue();
        Integer totalCustomerCount = customerMapper.countCustomer();
        BigDecimal successTranAmount = tranMapper.countSuccessTranAmount();
        BigDecimal totalTranAmount = tranMapper.countTotalTranAmount();
        return SummaryDataQuery.builder()
                .effectiveActivityCount(effectiveActivityCount)
                .totalActivityCount(totalActivityCount)
                .totalClueCount(totalClueCount)
                .totalCustomerCount(totalCustomerCount)
                .successTranAmount(successTranAmount)
                .totalTranAmount(totalTranAmount)
                .build();
    }
    
    public List<ChartDataQuery> getSaleFunnelData() {
        int clueCount = clueMapper.countClue();
        int customerCount = customerMapper.countCustomer();
        int tranCount = tranMapper.countTotalTran();
        int successTranCount = tranMapper.countSuccessTran();
        return List.of(
                new ChartDataQuery("线索", clueCount),
                new ChartDataQuery("客户", customerCount),
                new ChartDataQuery("交易", tranCount),
                new ChartDataQuery("成交", successTranCount)
        );
    }
    
    public List<ChartDataQuery> getCluePieData() {
        return clueMapper.countClueBySource();
    }
    
    public List<ChartDataQuery> getActivityBarData(Integer year) {
        return activityMapper.countActivityByYear(year);
    }
}
