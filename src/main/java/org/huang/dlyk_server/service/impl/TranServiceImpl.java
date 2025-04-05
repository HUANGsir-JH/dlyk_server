package org.huang.dlyk_server.service.impl;

import jakarta.annotation.Resource;
import org.huang.dlyk_server.mapper.TTranMapper;
import org.huang.dlyk_server.model.TTran;
import org.huang.dlyk_server.model.TUser;
import org.huang.dlyk_server.service.TranService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class TranServiceImpl implements TranService {
    @Resource
    private TTranMapper tranMapper;
    
    @Override
    public int addTran(TTran tran) {
        tran.setCreateTime(new Date());
        TUser user = (TUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        tran.setCreateBy(user.getId());
        // 交易流水号
        // 使用当前时间戳作为前缀
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String timeStamp = dateFormat.format(new Date());
        // 生成4位随机数
        String randomNum = String.format("%04d", (int)(Math.random() * 10000));
        var tranNo = timeStamp + randomNum;
        tran.setTranNo(tranNo);
        return tranMapper.insert(tran);
    }
}
