package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TTranHistory;
import org.springframework.stereotype.Repository;

@Repository
public interface TTranHistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TTranHistory record);

    int insertSelective(TTranHistory record);

    TTranHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TTranHistory record);

    int updateByPrimaryKey(TTranHistory record);
}