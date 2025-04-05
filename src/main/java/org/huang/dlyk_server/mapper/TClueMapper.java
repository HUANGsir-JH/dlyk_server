package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.commons.DataScope;
import org.huang.dlyk_server.model.TClue;
import org.huang.dlyk_server.query.ChartDataQuery;
import org.huang.dlyk_server.query.SqlFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TClueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TClue record);

    int insertSelective(TClue record);

    TClue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClue record);

    int updateByPrimaryKey(TClue record);
    
    @DataScope(tableAlias = "tc",tableField = "owner_id")
    List<TClue> selectByPage(SqlFilter query);
    
    void saveClues(List<TClue> cachedDataList);
    
    Integer countClue();
    
    List<ChartDataQuery> countClueBySource();
}