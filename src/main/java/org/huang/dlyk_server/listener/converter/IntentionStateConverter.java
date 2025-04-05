package org.huang.dlyk_server.listener.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import org.huang.dlyk_server.DlykServerApplication;
import org.huang.dlyk_server.constant.DicEnum;
import org.huang.dlyk_server.model.TDicValue;

import java.util.List;

public class IntentionStateConverter implements Converter<Object> {
    @Override
    public Object convertToJavaData(ReadCellData<?> cellData, ExcelContentProperty contentProperty, GlobalConfiguration globalConfiguration) throws Exception {
        String state = cellData.getStringValue();
        List<TDicValue> valueList =
                (List<TDicValue>) DlykServerApplication.CACHE.get(DicEnum.INTENTIONSTATE.getTypeCode());
        if (valueList != null) {
            for (TDicValue value : valueList) {
                if (value.getTypeValue().equals(state)) {
                    return value.getId();
                }
            }
        }
        return -1; // 如果没有找到对应的值，返回-1
    }
}
