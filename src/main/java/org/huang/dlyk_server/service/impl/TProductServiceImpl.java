package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TProductMapper;
import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.service.TProductService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TProductServiceImpl implements TProductService {
    @Resource
    private TProductMapper tProductMapper;
    @Override
    public List<TProduct> getAllOnSaleProduct() {
        return tProductMapper.selectAllOnSaleProduct();
    }
}
