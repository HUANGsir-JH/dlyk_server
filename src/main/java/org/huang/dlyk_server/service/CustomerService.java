package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TCustomer;
import org.huang.dlyk_server.query.CustomerQuery;
import org.huang.dlyk_server.result.CustomerExcel;

import java.util.List;

public interface CustomerService {
    boolean convertClueToCustomer(CustomerQuery customerQuery);
    
    PageInfo<TCustomer> getCustomersByPage(Integer current);
    
    List<CustomerExcel> getAllCustomers();
    
    List<CustomerExcel> getSelectedCustomers(List<String> ids);
}
