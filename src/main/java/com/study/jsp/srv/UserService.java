package com.study.jsp.srv;

import java.util.Map;

import com.study.jsp.model.UserDTO;

public interface UserService {
  UserDTO getOne(Map<String,String> loginInfo);
}
