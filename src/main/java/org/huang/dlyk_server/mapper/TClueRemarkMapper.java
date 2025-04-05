package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TClueRemark;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TClueRemarkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TClueRemark record);

    int insertSelective(TClueRemark record);

    TClueRemark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClueRemark record);

    int updateByPrimaryKey(TClueRemark record);
    
    @DataScope(tableAlias = "tcr",tableField = "create_by")
    List<TClueRemark> selectClueRemarks(SqlFilter query, Integer clueId);
}