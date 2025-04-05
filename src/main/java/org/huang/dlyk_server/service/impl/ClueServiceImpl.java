package org.huang.dlyk_server.service.impl;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.listener.UploadDataListener;
import org.huang.dlyk_server.mapper.TClueMapper;
import org.huang.dlyk_server.model.TClue;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.service.ClueService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {
    @Resource
    private TClueMapper clueMapper;
    
    @Override
    public PageInfo<TClue> getCluesByPage(Integer current) {
        PageHelper.startPage(current, Constant.PAGE_SIZE);
        List<TClue> clues = clueMapper.selectByPage(SqlFilter.builder().build());
        return new PageInfo<>(clues);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addClue(TClue clue) {
        clue.setCreateTime(new Date());
        
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        clue.setCreateBy(user.getId());
        return clueMapper.insert(clue);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateClue(TClue clue) {
        clue.setEditTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        clue.setEditBy(user.getId());
        return clueMapper.updateByPrimaryKeySelective(clue);
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteClue(Integer id) {
        return clueMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public void importExcel(MultipartFile file) {
        // EasyExcel 读取Excel文件
        try {
            // 读取Excel文件,参数：1.文件输入流，2.数据类型，3.监听器
            EasyExcel.read(file.getInputStream(), TClue.class, new UploadDataListener(clueMapper)).sheet().doRead();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
