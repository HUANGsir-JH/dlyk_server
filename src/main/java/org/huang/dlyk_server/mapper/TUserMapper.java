package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.OwnerQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
    
    TUser selectByLoginAct(String username);
    
    @DataScope(tableAlias = "t_user", tableField = "id")
    List<TUser> selectUserByPage(SqlFilter query); // 数据权限过滤.在AOP中已经写定了是第一个参数，其他参数写后面
    
    @DataScope(tableAlias = "t_user", tableField = "id")
    List<OwnerQuery> selectOwners(SqlFilter query);
}