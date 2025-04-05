package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductFilter {
    private String name;
    private BigDecimal guidePriceS; // 官方指导起始价
    private BigDecimal guidePriceE; // 官方指导最高价
    private BigDecimal quotation; // 经销商报价
    private int state; // 状态 0在售 1售罄
}
