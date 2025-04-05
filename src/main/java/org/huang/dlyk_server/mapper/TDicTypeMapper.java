package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TDicType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TDicTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TDicType record);

    int insertSelective(TDicType record);

    TDicType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TDicType record);

    int updateByPrimaryKey(TDicType record);
    
    List<TDicType> selectAllDicType();
    
    List<TDicType> selectDicTypes();
}