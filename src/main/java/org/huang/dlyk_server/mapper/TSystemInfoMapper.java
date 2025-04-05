package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TSystemInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface TSystemInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TSystemInfo record);

    int insertSelective(TSystemInfo record);

    TSystemInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TSystemInfo record);

    int updateByPrimaryKey(TSystemInfo record);
}