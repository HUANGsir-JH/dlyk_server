package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SummaryDataQuery;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.StatisticService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StatisticController {
    @Resource
    private StatisticService statisticService;
    
    @GetMapping("/api/summary/data")
    public R getSummaryData() {
        SummaryDataQuery summaryData = statisticService.getSummaryData();
        return R.OK(summaryData);
    }
    
    @GetMapping("/api/saleFunnel/data")
    public R getSaleFunnelData() {
        List<ChartDataQuery> funnelData = statisticService.getSaleFunnelData();
        return R.OK(funnelData);
    }
    
    @GetMapping("/api/cluePie/data")
    public R getCluePieData() {
        List<ChartDataQuery> cluePieData = statisticService.getCluePieData();
        return R.OK(cluePieData);
    }
    
    @GetMapping("/api/activityBar/data")
    public R getActivityBarData(@RequestParam Integer year) {
        List<ChartDataQuery> activityBarData = statisticService.getActivityBarData(year);
        return R.OK(activityBarData);
    }
}
