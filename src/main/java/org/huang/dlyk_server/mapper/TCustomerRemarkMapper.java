package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TCustomerRemark;
import org.huang.dlyk_server.query.CustomerRemarkQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TCustomerRemarkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TCustomerRemark record);

    int insertSelective(TCustomerRemark record);

    TCustomerRemark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TCustomerRemark record);

    int updateByPrimaryKey(TCustomerRemark record);
    
    @DataScope(tableAlias = "tcr", tableField = "create_by")
    List<CustomerRemarkQuery> selectByCustomerId(SqlFilter query, Integer customerId);
}