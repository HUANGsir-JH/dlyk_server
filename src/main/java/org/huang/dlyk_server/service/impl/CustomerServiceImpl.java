package org.huang.dlyk_server.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.manager.CustomerManager;
import org.huang.dlyk_server.model.TCustomer;
import org.huang.dlyk_server.query.CustomerQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.result.CustomerExcel;
import org.huang.dlyk_server.service.CustomerService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    
    @Resource
    private CustomerManager customerManager;
    
    @Override
    public boolean convertClueToCustomer(CustomerQuery customerQuery) {
        return customerManager.convertCustomer(customerQuery);
    }
    
    @Override
    public PageInfo<TCustomer> getCustomersByPage(Integer current) {
        PageHelper.startPage(current, Constant.PAGE_SIZE);
        List<TCustomer> customers = customerManager.getCustomersByPage(SqlFilter.builder().build());
        PageInfo<TCustomer> pageInfo = new PageInfo<>(customers);
        return pageInfo;
    }
    
    @Override
    public List<CustomerExcel> getAllCustomers() {
        return customerManager.getAllCustomers();
    }
    
    @Override
    public List<CustomerExcel> getSelectedCustomers(List<String> ids) {
        List<Integer> customerIds = ids.stream().map(Integer::parseInt).toList();
        return customerManager.getSelectedCustomers(customerIds);
    }
}
