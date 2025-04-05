package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TTran;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.TranService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TranController {
    @Resource
    private TranService tranService;
    
    @PostMapping("/api/tran")
    public R addTran(@RequestBody TTran tran){
        int result = tranService.addTran(tran);
        return result > 0 ? R.OK() :R.FAIL();
    }
}
