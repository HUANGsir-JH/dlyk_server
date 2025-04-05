package org.huang.dlyk_server.controller;

import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TClue;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.ClueService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@RestController
public class ClueController {
    @Resource
    private ClueService clueService;
    
    @PreAuthorize("hasAuthority('clue:list') || hasAuthority('clue:view')")
    @GetMapping("/api/clues")
    public R getClues(@RequestParam(value="current", defaultValue="1") Integer current){
        PageInfo<TClue> clues = clueService.getCluesByPage(current);
        return R.OK(clues);
    }
    
    @PreAuthorize("hasAuthority('clue:add')")
    @PostMapping("/api/clue")
    public R addClue(@RequestBody TClue clue){
        int result = clueService.addClue(clue);
        return result > 0 ? R.OK("添加成功") : R.FAIL("添加失败");
    }
    
    @PreAuthorize("hasAuthority('clue:edit')")
    @PutMapping("/api/clue")
    public R updateClue(@RequestBody TClue clue){
        int result = clueService.updateClue(clue);
        return result > 0 ? R.OK("修改成功") : R.FAIL("修改失败");
    }
    
    @PreAuthorize("hasAuthority('clue:delete')")
    @DeleteMapping("/api/clue/{id}")
    public R deleteClue(@PathVariable("id") Integer id){
        int result = clueService.deleteClue(id);
        return result > 0 ? R.OK("删除成功") : R.FAIL("删除失败");
    }
    
    @PreAuthorize("hasAuthority('clue:delete')")
    @DeleteMapping("/api/clue/batch")
    public R deleteClueBatch(@RequestParam("ids") List<String> ids){
        int result = 0;
        int len = ids.size();
        for (var id : ids) {
            result += clueService.deleteClue(Integer.parseInt(id));
        }
        return result == len ? R.OK("批量删除成功") : R.FAIL("批量删除失败");
    }
    
    @PreAuthorize("hasAuthority('clue:import')")
    @PostMapping("/api/importExcel")
    public R importExcel(@RequestBody MultipartFile file) {// file这个参数是前端传过来的文件，要与前端名称保持一致
        clueService.importExcel(file);
        return R.OK("导入成功");
    }

}
