package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TDicType;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.TDicTypeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TDicTypeController {
    @Resource
    private TDicTypeService dicTypeService;
    
    @GetMapping("/api/dicType")
    public R getDicTypes(){
        return R.OK(dicTypeService.getDicTypes());
    }
    
    @PreAuthorize(value = "hasAnyRole('dicType:add')")
    @PostMapping("/api/dicType")
    public R addDicType(@RequestBody TDicType dicType){
        int result = dicTypeService.addDicType(dicType);
        return result > 0 ? R.OK("添加成功") : R.FAIL("添加失败");
    }
    
    @PreAuthorize(value = "hasAnyRole('dicType:delete')")
    @DeleteMapping("/api/dicType/batchDelete")
    public R batchDelete(@RequestParam(value = "ids") List<String> ids){
        int successCount = 0;
        for (String id : ids) {
            int result = dicTypeService.deleteDicTypeById(Integer.parseInt(id));
            if (result > 0) {
                successCount++;
            }
        }
        return successCount == ids.size() ? R.OK("批量删除成功") : R.FAIL("批量删除失败");
    }
    
    @PreAuthorize(value = "hasAnyRole('dicType:delete')")
    @DeleteMapping("/api/dicType/{id}")
    public R deleteDicTypeById(@PathVariable("id") int id){
        int result = dicTypeService.deleteDicTypeById(id);
        return result > 0 ? R.OK("删除成功") : R.FAIL("删除失败");
    }
    
    @PreAuthorize(value = "hasAnyRole('dicType:edit')")
    @PutMapping("/api/dicType")
    public R updateDicType(@RequestBody TDicType dicType){
        int result = dicTypeService.updateDicType(dicType);
        return result > 0 ? R.OK("修改成功") : R.FAIL("修改失败");
    }
}
