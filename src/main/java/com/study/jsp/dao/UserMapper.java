package com.study.jsp.dao;

import java.util.Map;

import com.study.jsp.model.UserVO;

public interface UserMapper {

  UserVO getOne(Map<String,String> loginInfo);

}
