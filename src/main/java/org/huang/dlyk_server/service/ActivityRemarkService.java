package org.huang.dlyk_server.service;

import org.huang.dlyk_server.model.TActivityRemark;

import java.util.List;

public interface ActivityRemarkService {
    List<TActivityRemark> getRemarks(Integer activityId);
    
    int addRemark(TActivityRemark remark);
    
    int updateRemark(TActivityRemark updateActivityRemark);
    
    int deleteRemark(Integer id);
}
