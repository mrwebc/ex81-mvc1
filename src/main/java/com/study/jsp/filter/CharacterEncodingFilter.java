package com.study.jsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//어노테이션 방식으로 설정할 경우 아래와 같이 작성후 web.xml의 필터매핑코드 주석처리
@WebFilter("/*") 
public class CharacterEncodingFilter implements Filter {

  private String encoding = null;
  
  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    encoding = "utf-8";
  }

  @Override
  //요청이 있을 때마다 매번 실행
  public void doFilter(ServletRequest req, ServletResponse res, 
      FilterChain chain) throws IOException, ServletException {
    
    //서블릿 실행전 처리할 코드 
    req.setCharacterEncoding(encoding);      
    //System.out.println("이 메세지는 서블릿 실행전 출력됩니다.");
    
    //다음 필터 또는 서블릿으로 흐름을 넘긴다.
    chain.doFilter(req, res);

    //서블릿 실행후 처리할 코드 
    //System.out.println("이 메세지는 서블릿 실행후 출력됩니다.");
  }


}