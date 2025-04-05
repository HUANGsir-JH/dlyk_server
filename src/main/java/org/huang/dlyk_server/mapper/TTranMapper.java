package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TTran;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface TTranMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TTran record);

    int insertSelective(TTran record);

    TTran selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TTran record);

    int updateByPrimaryKey(TTran record);
    
    BigDecimal countSuccessTranAmount();
    
    BigDecimal countTotalTranAmount();
    
    int countTotalTran();
    
    int countSuccessTran();
}