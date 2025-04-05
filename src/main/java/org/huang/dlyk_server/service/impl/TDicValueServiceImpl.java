package org.huang.dlyk_server.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.mapper.TDicValueMapper;
import org.huang.dlyk_server.model.TDicType;
import org.huang.dlyk_server.model.TDicValue;
import org.huang.dlyk_server.query.*;
import org.huang.dlyk_server.service.TDicValueService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TDicValueServiceImpl implements TDicValueService {
    @Resource
    private TDicValueMapper tDicValueMapper;
    
    @Override
    public List<AppellationQuery> getAppellationList() {
        return tDicValueMapper.selectAppellationList();
    }
    
    @Override
    public List<NeedLoanQuery> getNeedLoanList() {
        return tDicValueMapper.selectNeedLoanList();
    }
    
    @Override
    public List<IntentionStateQuery> getIntentionStateList() {
        return tDicValueMapper.selectIntentionStateList();
    }
    
    @Override
    public List<IntentionProductQuery> getIntentionProductList() {
        return tDicValueMapper.selectIntentionProductList();
    }
    
    @Override
    public List<ClueStateQuery> getClueStateList() {
        return tDicValueMapper.selectClueStateList();
    }
    
    @Override
    public List<SourceQuery> getSourceList() {
        return tDicValueMapper.selectSourceList();
    }
    
    @Override
    public List<NoteWayQuery> getNoteWayList() {
        return tDicValueMapper.selectNoteWayList();
    }
    
    @Override
    public List<TranStageQuery> getStageList() {
        return tDicValueMapper.selectStageList();
    }
    
    @Override
    public PageInfo<TDicValue> getDicValue(int current, String typeCode) {
        PageHelper.startPage(current, Constant.PAGE_SIZE);
        List<TDicValue> dicValueList = tDicValueMapper.selectDicValue(typeCode);
        return new PageInfo<>(dicValueList);
    }
}
