package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChartDataQuery {
    private String name;
    private Integer value;
}
