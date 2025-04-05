package org.huang.dlyk_server.listener.converter;

import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import org.huang.dlyk_server.DlykServerApplication;
import org.huang.dlyk_server.constant.DicEnum;
import org.huang.dlyk_server.model.TProduct;

import java.util.List;

public class IntentionProductionConverter implements Converter<Object> {
    @Override
    public Object convertToJavaData(ReadCellData<?> cellData, ExcelContentProperty contentProperty, GlobalConfiguration globalConfiguration) throws Exception {
        String product = cellData.getStringValue();
        // 从缓存中获取产品列表
        List<TProduct> valueList =
                (List<TProduct>) DlykServerApplication.CACHE.get(DicEnum.INTENTIONPRODUCT.getTypeCode());
        if(valueList != null) {
            for (TProduct value : valueList) {
                // 遍历产品列表，查找匹配的产品名称
                if (value.getName().equals(product)) {
                    return value.getId(); // 返回匹配的产品ID
                }
            }
        }
        return -1; // 如果没有找到对应的值，返回-1
    }
}
