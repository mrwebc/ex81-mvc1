package com.study.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.study.jsp.model.BoardVO;

public class BoardMapperDAO implements BoardMapper{
  
	private SqlSession sqlSession;
	public BoardMapperDAO(SqlSession sqlSession) {
	  this.sqlSession = sqlSession;
	}
	
	public BoardMapper mp() {
	  return sqlSession.getMapper(BoardMapper.class);
	}
	

	public List<BoardVO> findAll() {		
	  return mp().findAll();	
	}
	
	public BoardVO getOne(int seq) {	
	  return mp().getOne(seq);
	}
	
	public int save(BoardVO vo) {		
	  int result = 0;
	  
	  try {
	    result = mp().save(vo);
	    sqlSession.commit();
	  }catch(Exception e) {
	    e.printStackTrace();
	    sqlSession.rollback();
	  }
	  
	  return result;
	}
	
	public int update(BoardVO vo) {
    int result = 0;
    
    try {
      result = mp().update(vo);
      sqlSession.commit();
    }catch(Exception e) {
      e.printStackTrace();
      sqlSession.rollback();
    }
    
    return result;
	}
	
	public int delete(int seq) {
	  int result = 0;
    
    try {
      result = mp().delete(seq);
      sqlSession.commit();
    }catch(Exception e) {
      e.printStackTrace();
      sqlSession.rollback();
    }
    
    return result;
	}
	
	public int increaseCnt(int seq) {
	  int result = 0;
    
    try {
      result = mp().increaseCnt(seq);
      sqlSession.commit();
    }catch(Exception e) {
      e.printStackTrace();
      sqlSession.rollback();
    }
    
    return result;
	}
	
}
