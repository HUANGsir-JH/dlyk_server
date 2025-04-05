package org.huang.dlyk_server.service;

import com.github.pagehelper.PageInfo;
import org.huang.dlyk_server.model.TClue;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ClueService {
    PageInfo<TClue> getCluesByPage(Integer current);
    
    int addClue(TClue clue);
    
    int updateClue(TClue clue);
    
    int deleteClue(Integer id);
    
    void importExcel(MultipartFile file);
}
