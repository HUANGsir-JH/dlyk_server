package org.huang.dlyk_server.manager;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TClueMapper;
import org.huang.dlyk_server.mapper.TCustomerMapper;
import org.huang.dlyk_server.model.TClue;
import org.huang.dlyk_server.model.TCustomer;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.CustomerQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.result.CustomerExcel;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class CustomerManager {
    @Resource
    private TClueMapper clueMapper;
    @Resource
    private TCustomerMapper customerMapper;
    
    @Transactional(rollbackFor = Exception.class) // 事务注解，表示该方法需要事务支持
    public boolean convertCustomer(CustomerQuery customerQuery) {
        // 检查线索是否已经转换
        TClue tClue = clueMapper.selectByPrimaryKey(customerQuery.getClueId());
        if (tClue.getState() == -1){
            throw new RuntimeException("线索已转换");
        }
        // 客户表插入数据
        TCustomer customer = new TCustomer();
        BeanUtils.copyProperties(customerQuery, customer);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date nextContactTime = sdf.parse(customerQuery.getNextContactTime());
            customer.setNextContactTime(nextContactTime);
        } catch (ParseException e) {
            throw new RuntimeException("日期格式错误");
        }
        customer.setCreateTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer.setCreateBy(user.getId());
        int insertSuccess = customerMapper.insert(customer);
        // 线索表更新状态：state=-1
        tClue.setState(-1);
        tClue.setEditBy(user.getId());
        tClue.setEditTime(new Date());
        int updateSuccess = clueMapper.updateByPrimaryKeySelective(tClue);
        return insertSuccess > 0 && updateSuccess > 0;
    }
    
    public List<TCustomer> getCustomersByPage(SqlFilter query) {
        return customerMapper.selectCustomerByPage(query);
    }
    
    public List<CustomerExcel> getAllCustomers() {
        return customerMapper.selectAllCustomers(SqlFilter.builder().build());
    }
    
    public List<CustomerExcel> getSelectedCustomers(List<Integer> customerIds) {
        if (customerIds == null || customerIds.isEmpty()) {
            return List.of();
        }
        return customerMapper.selectSelectedCustomers(customerIds);
    }
}
