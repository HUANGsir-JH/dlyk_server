package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TDicValue;
import org.huang.dlyk_server.query.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TDicValueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TDicValue record);

    int insertSelective(TDicValue record);

    TDicValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TDicValue record);

    int updateByPrimaryKey(TDicValue record);
    
    List<AppellationQuery> selectAppellationList();
    
    List<NeedLoanQuery> selectNeedLoanList();
    
    List<IntentionStateQuery> selectIntentionStateList();
    
    List<IntentionProductQuery> selectIntentionProductList();
    
    List<ClueStateQuery> selectClueStateList();
    
    List<SourceQuery> selectSourceList();
    
    List<NoteWayQuery> selectNoteWayList();
    
    List<TranStageQuery> selectStageList();
    
    List<TDicValue> selectDicValue(String typeCode);
}