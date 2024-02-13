package com.study.jsp.dao;

import java.util.List;

import com.study.jsp.model.BoardVO;

public interface BoardMapper {

  public List<BoardVO> findAll();
  
  public BoardVO getOne(int seq);
  
  public int save(BoardVO vo);
  
  public int update(BoardVO vo);
  
  public int delete(int seq);
  
  public int increaseCnt(int seq);
  
}
