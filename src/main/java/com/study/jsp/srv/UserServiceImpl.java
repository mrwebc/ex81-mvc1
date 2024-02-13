package com.study.jsp.srv;

import java.util.Map;

import com.study.jsp.dao.UserMapper;
import com.study.jsp.model.UserDTO;
import com.study.jsp.model.UserVO;

public class UserServiceImpl implements UserService{

  private UserMapper dao;
  
  public UserServiceImpl(UserMapper dao) {
    this.dao = dao;
  }
  
  public UserDTO getOne(Map<String,String> loginInfo) {  
    UserVO vo = dao.getOne(loginInfo);
    
    UserDTO dto = new UserDTO();
    
    dto.setName(vo.getName());
    dto.setPassword(vo.getPassword());
    dto.setUserid(vo.getUserid());
    dto.setRole(vo.getRole());
    
    return dto;
  }

}
