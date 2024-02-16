<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.ioc.Factory"%>
<%@page import="com.study.jsp.model.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	int seq = 0;
	String seq_ = request.getParameter("seq");
	if(!seq_.isEmpty()){
	  seq = Integer.valueOf(seq_);
	}

    //클라이언트가 보내온 데이터를 DTO 패키징 처리
    BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setSeq(seq);

    //DB에 조회요청
    //어떤서비스객체.메소드(loginInfo);
	BoardService boardService = Factory.INSTANCE.getBoardService();
    boardService.update(dto);
	
    /*
    sendRedirect()의 기준(루트)은 http://localhost:8090 까지 이므로 아래의 세가지 방법이 가능하다.      
    만약 설정해도 반영이 안될 경우는 Project>Clean 을 하면 해결된다.
      1. response.sendRedirect("/jsp_mvc2/listCtrl");
      2. response.sendRedirect(request.getContextPath() + "/listCtrl");
      3. response.sendRedirect("./listCtrl");  
  */ 
  
	response.sendRedirect(request.getContextPath()+"/list.jsp");
%>