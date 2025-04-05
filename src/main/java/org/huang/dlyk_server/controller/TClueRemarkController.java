package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TClueRemark;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.TClueRemarkService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TClueRemarkController {
    @Resource
    private TClueRemarkService tClueRemarkService;
    
    @GetMapping("/api/clueRemark")
    public R getClueRemark(@RequestParam(value = "clueId") Integer id) {
        List<TClueRemark> clueRemarks = tClueRemarkService.getAllClueRemarks(id);
        return R.OK(clueRemarks);
    }
    
    @PostMapping("/api/clueRemark")
    public R addClueRemark(@RequestBody TClueRemark clueRemark) {
        int result = tClueRemarkService.addClueRemark(clueRemark);
        return result > 0 ? R.OK() : R.FAIL("添加失败");
    }
    
    @PutMapping("/api/clueRemark")
    public R updateClueRemark(@RequestBody TClueRemark clueRemark) {
        int result = tClueRemarkService.updateClueRemark(clueRemark);
        return result > 0 ? R.OK() : R.FAIL("更新失败");
    }
    
    @DeleteMapping("/api/clueRemark/{id}")
    public R deleteClueRemark(@PathVariable("id") Integer id) {
        int result = tClueRemarkService.deleteClueRemark(id);
        return result > 0 ? R.OK() : R.FAIL("删除失败");
    }
}
