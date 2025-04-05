package org.huang.dlyk_server.query;

import lombok.Data;

@Data
public class CustomerRemarkQuery {
    private Integer id;
    private Integer customerId;
    private String noteContent;
    private String noteWayName;
    private String createTime;
    private String createByName;
    private String editTime;
    private String editByName;
}
