package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TTranRemark;
import org.springframework.stereotype.Repository;

@Repository
public interface TTranRemarkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TTranRemark record);

    int insertSelective(TTranRemark record);

    TTranRemark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TTranRemark record);

    int updateByPrimaryKey(TTranRemark record);
}