package com.study.jsp.ioc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.study.jsp.persistence.BoardMapper;
import com.study.jsp.persistence.BoardMapperDAO;
import com.study.jsp.persistence.UserMapper;
import com.study.jsp.persistence.UserMapperDAO;
import com.study.jsp.srv.BoardService;
import com.study.jsp.srv.BoardServiceImpl;
import com.study.jsp.srv.UserService;
import com.study.jsp.srv.UserServiceImpl;

import myBatis.MyBatisManager;

public enum Factory {
  
  //싱글톤
  INSTANCE;
  
  //마이바티즈
  private SqlSessionFactory sqlSessionFactory = MyBatisManager.getSqlSessionFactory();
  private SqlSession sqlSession = sqlSessionFactory.openSession(false);
  

  BoardMapper boardDao = new BoardMapperDAO(sqlSession);    
  UserMapper userDao = new UserMapperDAO(sqlSession);    
  
  BoardService boardService = new BoardServiceImpl(boardDao);
  UserService userService = new UserServiceImpl(userDao);
  
  public BoardService getBoardService() {
    return boardService;
  }

  public UserService getUserService() {
    return userService;
  }
  
}
