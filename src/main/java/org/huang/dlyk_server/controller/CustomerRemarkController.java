package org.huang.dlyk_server.controller;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TCustomerRemark;
import org.huang.dlyk_server.query.CustomerRemarkQuery;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.CustomerRemarkService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CustomerRemarkController {
    
    @Resource
    private CustomerRemarkService customerRemarkService;
    
    @GetMapping("/api/customerRemark")
    public R getCustomerRemark(@RequestParam Integer customerId) {
        List<CustomerRemarkQuery> customerRemarks = customerRemarkService.getCustomerRemark(customerId);
        return R.OK(customerRemarks);
    }
    
    @PostMapping("/api/customerRemark")
    public R addCustomerRemark(@RequestBody TCustomerRemark customerRemark) {
        int result = customerRemarkService.addCustomerRemark(customerRemark);
        return result > 0 ? R.OK("添加成功") : R.FAIL("添加失败");
    }
    
    @DeleteMapping("/api/customerRemark/{id}")
    public R deleteCustomerRemark(@PathVariable Integer id) {
        int result = customerRemarkService.deleteCustomerRemark(id);
        return result > 0 ? R.OK("删除成功") : R.FAIL("删除失败");
    }
}
