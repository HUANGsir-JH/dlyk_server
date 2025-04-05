package org.huang.dlyk_server.service;

import org.huang.dlyk_server.model.TCustomerRemark;
import org.huang.dlyk_server.query.CustomerRemarkQuery;

import java.util.List;

public interface CustomerRemarkService {
    List<CustomerRemarkQuery> getCustomerRemark(Integer customerId);
    
    int addCustomerRemark(TCustomerRemark customerRemark);
    
    int deleteCustomerRemark(Integer id);
}
