package org.huang.dlyk_server.controller;

import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TDicValue;
import org.huang.dlyk_server.query.*;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.TDicValueService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TDicValueController {
    @Resource
    private TDicValueService tDicValueService;
    
    @GetMapping("/api/appeallationList")
    public R getAppellationList() {
        List<AppellationQuery> list = tDicValueService.getAppellationList();
        return R.OK(list);
    }
    
    @GetMapping("/api/needLoanList")
    public R getNeedLoanList() {
        List<NeedLoanQuery> list = tDicValueService.getNeedLoanList();
        return R.OK(list);
    }
    
    @GetMapping("/api/intentionStateList")
    public R getIntentionStateList() {
        List<IntentionStateQuery> list = tDicValueService.getIntentionStateList();
        return R.OK(list);
    }
    
    @GetMapping("/api/intentionProductList")
    public  R getIntentionProductList() {
        List<IntentionProductQuery> list = tDicValueService.getIntentionProductList();
        return R.OK(list);
    }
    
    @GetMapping("/api/clueStateList")
    public R getClueStateList() {
        List<ClueStateQuery> list = tDicValueService.getClueStateList();
        return R.OK(list);
    }
    
    @GetMapping("/api/sourceList")
    public R getSourceList() {
        List<SourceQuery> list = tDicValueService.getSourceList();
        return R.OK(list);
    }
    
    @GetMapping("/api/noteWayList")
    public R getNoteWayList() {
        List<NoteWayQuery> list = tDicValueService.getNoteWayList();
        return R.OK(list);
    }
    
    @GetMapping("/api/stageList")
    public R getStageList() {
        List<TranStageQuery> list = tDicValueService.getStageList();
        return R.OK(list);
    }
    
    @GetMapping("/api/dicValue")
    public R getDicValue(@RequestParam(value = "current" , defaultValue = "1") int current,
                         @RequestParam(value = "typeCode" , required = false) String typeCode){
        PageInfo<TDicValue> valueList = tDicValueService.getDicValue(current, typeCode);
        return R.OK(valueList);
    }
    
}
