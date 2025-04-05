package org.huang.dlyk_server.controller;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.huang.dlyk_server.model.TCustomer;
import org.huang.dlyk_server.query.CustomerQuery;
import org.huang.dlyk_server.result.CustomerExcel;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.CustomerService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
public class CustomerController {
    @Resource
    private CustomerService customerService;
    
    @PostMapping("/api/clue/customer")
    public R convertClueToCustomer(@RequestBody CustomerQuery customerQuery) {
        boolean isSuccess = customerService.convertClueToCustomer(customerQuery);
        return isSuccess ? R.OK("转换成功") : R.FAIL("转换失败");
    }
    
    @PreAuthorize("hasAuthority('customer:list') || hasAuthority('customer:view')")
    @GetMapping("/api/customers")
    public R getCustomers(@RequestParam(value="current", defaultValue="1") Integer current) {
        PageInfo<TCustomer> customers = customerService.getCustomersByPage(current);
        return R.OK(customers);
    }
    
    // EasyExcel以文件流形式导出Excel
    @PreAuthorize("hasAuthority('customer:export')")
    @GetMapping("/api/exportExcel")
    public void exportExcel(HttpServletResponse response) throws IOException {
        // 设置响应头
        response.setContentType("application/vnd.ms-excel"); // 设置文件类型
        response.setCharacterEncoding("utf-8"); // 设置字符编码
        String fileName = "customers_" + System.currentTimeMillis() + ".xlsx";
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName); // 告诉浏览器以附件形式下载文件。最重要！！！
        List<CustomerExcel> customers = customerService.getAllCustomers();
        EasyExcel.write(response.getOutputStream(), CustomerExcel.class).
                sheet().
                doWrite(customers);
    }
    
    @PreAuthorize("hasAuthority('customer:export')")
    @GetMapping("/api/exportSelectExcel")
    public void exportSelectExcel(HttpServletResponse response, @RequestParam List<String> ids) throws IOException {
        // 设置响应头
        response.setContentType("application/vnd.ms-excel"); // 设置文件类型
        response.setCharacterEncoding("utf-8"); // 设置字符编码
        String fileName = "selectedCustomers_" + System.currentTimeMillis() + ".xlsx";
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName); // 告诉浏览器以附件形式下载文件。最重要！！！
        List<CustomerExcel> customers = customerService.getSelectedCustomers(ids);
        EasyExcel.write(response.getOutputStream(), CustomerExcel.class).
                sheet().
                doWrite(customers);
    }
}
