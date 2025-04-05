package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TActivity;
import org.huang.dlyk_server.query.ActivityListQuery;
import org.huang.dlyk_server.query.ActivityQuery;
import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TActivity record);

    int insertSelective(TActivity record);

    TActivity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TActivity record);

    int updateByPrimaryKey(TActivity record);
    
    @DataScope(tableAlias = "ta", tableField = "id")
    List<TActivity> selectActivityByPage(SqlFilter query, ActivityQuery activityQuery);
    
    @DataScope(tableAlias = "ta", tableField = "id")
    List<ActivityListQuery> selectActivityList(SqlFilter query);
    
    Integer countEffectiveActivity();
    
    Integer countTotalActivity();
    
    List<ChartDataQuery> countActivityByYear(Integer year);
}