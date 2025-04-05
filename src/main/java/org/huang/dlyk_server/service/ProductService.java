package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.query.ProductFilter;

public interface ProductService {
    PageInfo<TProduct> getProductList(Integer current, ProductFilter query);
    
    int addProduct(TProduct product);
    
    int updateProduct(TProduct product);
}
