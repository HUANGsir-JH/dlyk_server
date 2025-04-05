package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TActivityRemark;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.ActivityRemarkService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ActivityRemarkController {
    @Resource
    private ActivityRemarkService activityRemarkService;
    
    @GetMapping("/api/activity_remark")
    public R getRemarks(Integer activityId) {
        List<TActivityRemark> remarks = activityRemarkService.getRemarks(activityId);
        return R.OK(remarks);
    }
    
    @PostMapping("/api/activity_remark")
    public R addRemark(@RequestBody TActivityRemark addActivityRemark) {
        int result = activityRemarkService.addRemark(addActivityRemark);
        return result > 0 ? R.OK() : R.FAIL("添加失败");
    }
    
    @PutMapping("/api/activity_remark")
    public R updateRemark(@RequestBody TActivityRemark editedActivityRemark) {
        int result = activityRemarkService.updateRemark(editedActivityRemark);
        return result > 0 ? R.OK() : R.FAIL("更新失败");
    }
    
    @DeleteMapping("/api/activity_remark/{id}")
    public R deleteRemark(@PathVariable Integer id) {
        int result = activityRemarkService.deleteRemark(id);
        return result > 0 ? R.OK() : R.FAIL("删除失败");
    }
}
