package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NeedLoanQuery {
    private Integer id;
    private String isNeedLoan;
}
