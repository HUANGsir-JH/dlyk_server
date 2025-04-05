package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummaryDataQuery {
    private Integer effectiveActivityCount; // 有效活动数
    private Integer totalActivityCount; // 活动总数
    private Integer totalClueCount; // 线索总数
    private Integer totalCustomerCount; // 客户总数
    private BigDecimal successTranAmount; // 成交金额
    private BigDecimal totalTranAmount; // 成交总金额
}
