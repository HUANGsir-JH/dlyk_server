package org.huang.dlyk_server.listener.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import org.huang.dlyk_server.DlykServerApplication;
import org.huang.dlyk_server.constant.DicEnum;
import org.huang.dlyk_server.model.TDicValue;

import java.util.List;

// 称呼转换
public class AppellationConverter implements Converter<Object> {
    // 把Excel中的称呼转换为数据库中的称呼id
    @Override
    public Object convertToJavaData(ReadCellData<?> cellData, ExcelContentProperty contentProperty, GlobalConfiguration globalConfiguration) throws Exception {
        // cellData -> 是Excel中的数据，比如"先生"
        String appellation = cellData.getStringValue();
        List<TDicValue> valueList =
                (List<TDicValue>) DlykServerApplication.CACHE.get(DicEnum.APPELLATION.getTypeCode());
        if (valueList != null) {
            for (TDicValue value : valueList) {
                if (value.getTypeValue().equals(appellation)) {
                    return value.getId();
                }
            }
        }
        return -1; // 如果没有找到对应的称呼，返回-1
    }
}
