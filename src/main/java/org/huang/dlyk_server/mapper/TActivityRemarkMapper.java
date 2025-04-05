package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TActivityRemark;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TActivityRemarkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TActivityRemark record);

    int insertSelective(TActivityRemark record);

    TActivityRemark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TActivityRemark record);

    int updateByPrimaryKey(TActivityRemark record);
    
    @DataScope(tableAlias = "t_activity_remark" , tableField = "create_by")
    List<TActivityRemark> getRemarksByActivityId(SqlFilter query ,Integer activityId);
    
    int updateByActivityIdSelective(TActivityRemark updateActivityRemark);
}