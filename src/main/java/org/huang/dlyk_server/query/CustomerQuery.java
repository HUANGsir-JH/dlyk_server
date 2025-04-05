package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerQuery {
    private Integer clueId;
    private Integer product;
    private String description;
    private String nextContactTime;
}
