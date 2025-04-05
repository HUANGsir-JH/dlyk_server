package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TDicValue;
import org.huang.dlyk_server.query.*;

import java.util.List;

public interface TDicValueService {
    
    List<AppellationQuery> getAppellationList();
    
    List<NeedLoanQuery> getNeedLoanList();
    
    List<IntentionStateQuery> getIntentionStateList();
    
    List<IntentionProductQuery> getIntentionProductList();
    
    List<ClueStateQuery> getClueStateList();
    
    List<SourceQuery> getSourceList();
    
    List<NoteWayQuery> getNoteWayList();
    
    List<TranStageQuery> getStageList();
    
    PageInfo<TDicValue> getDicValue(int current, String typeCode);
}
