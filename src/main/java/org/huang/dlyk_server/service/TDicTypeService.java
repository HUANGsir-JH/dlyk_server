package org.huang.dlyk_server.service;

import org.huang.dlyk_server.model.TDicType;

import java.util.List;

public interface TDicTypeService {
    List<TDicType> getAllDicType();
    
    List<TDicType> getDicTypes();
    
    int addDicType(TDicType dicType);
    
    int deleteDicTypeById(int i);
    
    int updateDicType(TDicType dicType);
}
