package com.study.jsp.conf;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisManager {
  
  //1. 마이바티즈 설정정보를 가질 객체변수
  static private SqlSessionFactory sqlSessionFactory;
  
  //2. 생성자에서 설정파일을 읽어들여 SqlSessionFactory 객체 생성
  @SuppressWarnings("static-access")
  private MyBatisManager() {
    String resource = "com/study/jsp/conf/mybatis-config.xml";//설정파일    
    InputStream inputStream = null;
    try {
      inputStream = Resources.getResourceAsStream(resource);
      this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      try {
        if(inputStream!=null) inputStream.close();
      } catch (IOException e) {}
    }
  }//end of 생성자
  
  
  //3. 싱글톤 처리 - SqlSessionFactory를 실행할 때마다 매번 설정 파일을 읽어 생성하지 않도록 재사용
  static public SqlSessionFactory getSqlSessionFactory() {
    if(sqlSessionFactory==null) {
      new MyBatisManager();
    }    
    return sqlSessionFactory;
}
  
  
}
