package org.huang.dlyk_server.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.mapper.TActivityMapper;
import org.huang.dlyk_server.model.TActivity;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.ActivityListQuery;
import org.huang.dlyk_server.query.ActivityQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.service.ActivityService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {
    @Resource
    private TActivityMapper activityMapper;
    @Override
    public PageInfo<TActivity> getActivitiesByPage(Integer current, ActivityQuery activityQuery) {
        PageHelper.startPage(current, Constant.PAGE_SIZE);
        List<TActivity> activities =
                activityMapper.selectActivityByPage(SqlFilter.builder().build(),activityQuery);
        return new PageInfo<>(activities);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addActivity(TActivity activity) {
        activity.setCreateTime(new Date());
        // 获取当前用户的 ID
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        activity.setCreateBy(user.getId());
        return activityMapper.insert(activity);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateActivity(TActivity activity) {
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        activity.setEditBy(user.getId());
        activity.setEditTime(new Date());
        return activityMapper.updateByPrimaryKeySelective(activity);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteActivity(Integer id) {
        return activityMapper.deleteByPrimaryKey(id);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteActivityBatch(List<String> idList) {
        int success = 0;
        for (String id : idList){
            int i = activityMapper.deleteByPrimaryKey(Integer.parseInt(id));
            if(i>=1){
                success++;
            }
        }
        return success;
    }
    
    @Override
    public List<ActivityListQuery> getActivityList() {
        return activityMapper.selectActivityList(SqlFilter.builder().build());
    }
}
