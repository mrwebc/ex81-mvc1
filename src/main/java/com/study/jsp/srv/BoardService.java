package com.study.jsp.srv;

import java.util.List;

import com.study.jsp.model.BoardDTO;

public interface BoardService {

  List<BoardDTO> findAll();
  
  BoardDTO getOne(int seq);
  
  int save(BoardDTO dto);
  
  int update(BoardDTO dto);
  
  int delete(int seq);
  
  int increaseCnt(int seq);
  
}
