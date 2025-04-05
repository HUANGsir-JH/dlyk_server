package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TPermission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TPermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TPermission record);

    int insertSelective(TPermission record);

    TPermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TPermission record);

    int updateByPrimaryKey(TPermission record);
    
    List<TPermission> selectMenuPermissionByUserId(Integer id);
    
    List<TPermission> selectButtonPermissionByUserId(Integer id);
}