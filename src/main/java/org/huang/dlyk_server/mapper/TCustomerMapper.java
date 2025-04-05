package org.huang.dlyk_server.mapper;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TCustomer;
import org.huang.dlyk_server.query.SqlFilter;
import org.huang.dlyk_server.result.CustomerExcel;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TCustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TCustomer record);

    int insertSelective(TCustomer record);

    TCustomer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TCustomer record);

    int updateByPrimaryKey(TCustomer record);
    
    @DataScope(tableAlias = "tct",tableField = "create_by")
    List<TCustomer> selectCustomerByPage(SqlFilter query);
    
    @DataScope(tableAlias = "tct",tableField = "create_by")
    List<CustomerExcel> selectAllCustomers(SqlFilter build);
    
    List<CustomerExcel> selectSelectedCustomers(List<Integer> ids);
    
    Integer countCustomer();
}