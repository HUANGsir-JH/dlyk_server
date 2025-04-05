package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TDicTypeMapper;
import org.huang.dlyk_server.model.TDicType;
import org.huang.dlyk_server.service.TDicTypeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TDicTypeServiceImpl implements TDicTypeService {
    @Resource
    private TDicTypeMapper tDicTypeMapper;
    @Override
    public List<TDicType> getAllDicType() { // 获取所有字典类型以及字典值
        return tDicTypeMapper.selectAllDicType();
    }
    
    @Override
    public List<TDicType> getDicTypes() { // 获取所有字典类型
        return tDicTypeMapper.selectDicTypes();
    }
    
    @Override
    public int addDicType(TDicType dicType) {
        return tDicTypeMapper.insert(dicType);
    }
    
    @Override
    public int deleteDicTypeById(int id) {
        return tDicTypeMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public int updateDicType(TDicType dicType) {
        return tDicTypeMapper.updateByPrimaryKey(dicType);
    }
}
