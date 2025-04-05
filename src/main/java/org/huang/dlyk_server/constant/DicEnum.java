package org.huang.dlyk_server.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public enum DicEnum {
    
    APPELLATION("appellation"),
    NEEDLOAN("needLoan"),
    INTENTIONSTATE("intentionState"),
    ClUESTATE("clueState"),
    CLUESOURCE("source"),
    INTENTIONPRODUCT("product"),
    ;
    private String typeCode;
}
