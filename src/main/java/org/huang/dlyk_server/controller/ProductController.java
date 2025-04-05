package org.huang.dlyk_server.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.huang.dlyk_server.model.TProduct;
import org.huang.dlyk_server.query.ProductFilter;
import org.huang.dlyk_server.result.R;
import org.huang.dlyk_server.service.ProductService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProductController {
    @Resource
    private ProductService productService;
    private static final ObjectMapper objectMapper = new ObjectMapper();
    
    
    @GetMapping("/api/product")
    public R getProductList(@RequestParam(value="current", defaultValue="1") Integer current,
                            @RequestParam(value="ProductFilter",required=false) String ProductFilter) throws JsonProcessingException {
        ProductFilter query;
        if (StringUtils.isEmpty(ProductFilter)) {
            // 如果 queryJson 为空，则使用默认的 ProductFilter 对象
            query = new ProductFilter();
        } else {
            // 将 JSON 字符串反序列化为 ProductFilter 对象
            query = objectMapper.readValue(ProductFilter, ProductFilter.class);
        }
        PageInfo<TProduct> productList = productService.getProductList(current, query);
        return R.OK(productList);
    }
    
    @PreAuthorize(value = "hasRole('product:add')")
    @PostMapping("/api/product")
    public R addProduct(@RequestBody TProduct product) {
        int result = productService.addProduct(product);
        return result > 0 ? R.OK("添加成功") : R.FAIL("添加失败");
    }
    
    @PreAuthorize(value = "hasRole('product:edit')")
    @PutMapping("/api/product")
    public R updateProduct(@RequestBody TProduct product) {
        int result = productService.updateProduct(product);
        return result > 0 ? R.OK("修改成功") : R.FAIL("修改失败");
    }
}
