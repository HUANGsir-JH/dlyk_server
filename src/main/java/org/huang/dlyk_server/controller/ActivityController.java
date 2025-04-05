package org.huang.dlyk_server.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TActivity;
import org.huang.dlyk_server.query.ActivityListQuery;
import org.huang.dlyk_server.query.ActivityQuery;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.ActivityService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ActivityController {
    @Resource
    private ActivityService activityService;
    private static final ObjectMapper objectMapper = new ObjectMapper();

    @PreAuthorize("hasAuthority('activity:search') || hasAuthority('activity:list')")
    @GetMapping("/api/activity")
    public R getActivities(@RequestParam(value="current", defaultValue="1") Integer current,
                           @RequestParam(value="query",required=false) String queryJson) throws JsonProcessingException {
        ActivityQuery query;
        if (StringUtils.isEmpty(queryJson)) {
            // 如果 queryJson 为空，则使用默认的 ActivityQuery 对象
            query = new ActivityQuery();
        } else {
            // 将 JSON 字符串反序列化为 ActivityQuery 对象
            query = objectMapper.readValue(queryJson, ActivityQuery.class);
        }
        PageInfo<TActivity> activities = activityService.getActivitiesByPage(current, query);
        return R.OK(activities);
    }
    
    @GetMapping("/api/activityList")
    public R getActivityList() {
        List<ActivityListQuery> activityList = activityService.getActivityList();
        return R.OK(activityList);
    }
    
    @PreAuthorize("hasAuthority('activity:add')")
    @PostMapping("/api/activity")
    public R addActivity(@RequestBody TActivity activity) {
        int i = activityService.addActivity(activity);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('activity:edit')")
    @PutMapping("/api/activity")
    public R updateActivity(@RequestBody TActivity activity) {
        int i = activityService.updateActivity(activity);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('activity:delete')")
    @DeleteMapping("/api/activity/{id}")
    public R deleteActivity(@PathVariable("id") Integer id) {
        int i = activityService.deleteActivity(id);
        return i>=1 ? R.OK() : R.FAIL();
    }
    
    @PreAuthorize("hasAuthority('activity:delete')")
    @DeleteMapping("/api/activity/batch")
    public R deleteActivityBatch(@RequestParam("ids") List<String> idList) {
        int len = idList.size();
        int i = activityService.deleteActivityBatch(idList);
        return i==len ? R.OK() : R.FAIL();
    }
}
