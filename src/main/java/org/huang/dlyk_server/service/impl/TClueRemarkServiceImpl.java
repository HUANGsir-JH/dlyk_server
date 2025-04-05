package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TClueRemarkMapper;
import org.huang.dlyk_server.model.TClueRemark;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.service.TClueRemarkService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TClueRemarkServiceImpl implements TClueRemarkService {
    @Resource
    private TClueRemarkMapper tClueRemarkMapper;
    
    @Override
    public List<TClueRemark> getAllClueRemarks(Integer clueId) {
        return tClueRemarkMapper.selectClueRemarks(SqlFilter.builder().build(), clueId);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addClueRemark(TClueRemark clueRemark) {
        clueRemark.setCreateTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        clueRemark.setCreateBy(user.getId());
        clueRemark.setDeleted(0);
        return tClueRemarkMapper.insert(clueRemark);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateClueRemark(TClueRemark clueRemark) {
        clueRemark.setEditTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        clueRemark.setEditBy(user.getId());
        return tClueRemarkMapper.updateByPrimaryKeySelective(clueRemark);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteClueRemark(Integer id) {
        return tClueRemarkMapper.deleteByPrimaryKey(id);
    }
}
