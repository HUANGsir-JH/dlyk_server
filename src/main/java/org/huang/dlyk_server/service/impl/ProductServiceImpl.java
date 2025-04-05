package org.huang.dlyk_server.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.constant.Constant;
import org.huang.dlyk_server.mapper.TProductMapper;
import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.query.ProductFilter;
import org.huang.dlyk_server.service.ProductService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private TProductMapper productMapper;
    
    @Override
    public PageInfo<TProduct> getProductList(Integer current, ProductFilter query) {
        PageHelper.startPage(current, Constant.PRODUCT_PAGE_SIZE);
        List<TProduct> productList = productMapper.getProductListByPage(query);
        return new PageInfo<>(productList);
    }
    
    @Override
    public int addProduct(TProduct product) {
        product.setCreateTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        product.setCreateBy(user.getId());
        return productMapper.insert(product);
    }
    
    @Override
    public int updateProduct(TProduct product) {
        product.setEditTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        product.setEditBy(user.getId());
        return productMapper.updateByPrimaryKeySelective(product);
    }
}
