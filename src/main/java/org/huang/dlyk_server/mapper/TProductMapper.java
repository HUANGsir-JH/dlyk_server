package org.huang.dlyk_server.mapper;

import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.query.ProductFilter;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TProduct record);

    int insertSelective(TProduct record);

    TProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TProduct record);

    int updateByPrimaryKey(TProduct record);
    
    List<TProduct> selectAllOnSaleProduct();
    
    List<TProduct> getProductListByPage(ProductFilter query);
}