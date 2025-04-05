package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TActivity;
import org.huang.dlyk_server.query.ActivityListQuery;
import org.huang.dlyk_server.query.ActivityQuery;

import java.util.List;

public interface ActivityService {
    PageInfo<TActivity> getActivitiesByPage(Integer current, ActivityQuery query);
    
    int addActivity(TActivity activity);
    
    int updateActivity(TActivity activity);
    
    int deleteActivity(Integer id);
    
    int deleteActivityBatch(List<String> idList);
    
    List<ActivityListQuery> getActivityList();
}
