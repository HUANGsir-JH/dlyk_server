package org.huang.dlyk_server.service;

import org.huang.dlyk_server.model.TClueRemark;

import java.util.List;

public interface TClueRemarkService {
    List<TClueRemark> getAllClueRemarks(Integer clueId);
    
    int addClueRemark(TClueRemark clueRemark);
    
    int updateClueRemark(TClueRemark clueRemark);
    
    int deleteClueRemark(Integer id);
}
