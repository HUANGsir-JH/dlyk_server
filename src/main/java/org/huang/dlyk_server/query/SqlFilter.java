package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SqlFilter {
    private String filterSql; // 数据权限的sql过滤条件，where id=1 之类的
}
