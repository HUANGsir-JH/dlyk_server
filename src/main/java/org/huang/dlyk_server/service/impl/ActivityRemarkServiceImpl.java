package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TActivityRemarkMapper;
import org.huang.dlyk_server.model.TActivityRemark;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.service.ActivityRemarkService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ActivityRemarkServiceImpl implements ActivityRemarkService {
    @Resource
    private TActivityRemarkMapper activityRemarkMapper;
    @Override
    public List<TActivityRemark> getRemarks(Integer activityId) {
        return activityRemarkMapper.getRemarksByActivityId(SqlFilter.builder().build(),activityId);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addRemark(TActivityRemark remark) {
        remark.setCreateTime(new Date());
        
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        remark.setCreateBy(user.getId());
        
        remark.setDeleted(0);
        return activityRemarkMapper.insert(remark);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateRemark(TActivityRemark updateActivityRemark) {
        updateActivityRemark.setEditTime(new Date());
        
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        updateActivityRemark.setEditBy(user.getId());
        return activityRemarkMapper.updateByPrimaryKeySelective(updateActivityRemark);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteRemark(Integer id) {
        return activityRemarkMapper.deleteByPrimaryKey(id);
    }
}
