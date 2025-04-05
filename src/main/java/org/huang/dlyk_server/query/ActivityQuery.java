package org.huang.dlyk_server.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActivityQuery {
    private Integer ownerId;
    private String activityName;
    private String beginTime;
    private String endTime;
    private Integer costBegin;
    private Integer costEnd;
    private String createTime;
}
