package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TCustomerRemarkMapper;
import org.huang.dlyk_server.model.TCustomerRemark;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.CustomerRemarkQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.service.CustomerRemarkService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CustomerRemarkServiceImpl implements CustomerRemarkService {
    @Resource
    private TCustomerRemarkMapper customerRemarkMapper;
    
    @Override
    public List<CustomerRemarkQuery> getCustomerRemark(Integer customerId) {
        return customerRemarkMapper.selectByCustomerId(SqlFilter.builder().build(),customerId);
    }
    
    @Override
    public int addCustomerRemark(TCustomerRemark customerRemark) {
        customerRemark.setCreateTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customerRemark.setCreateBy(user.getId());
        customerRemark.setDeleted(0);
        return customerRemarkMapper.insert(customerRemark);
    }
    
    @Override
    public int deleteCustomerRemark(Integer id) {
        return customerRemarkMapper.deleteByPrimaryKey(id);
    }
}
