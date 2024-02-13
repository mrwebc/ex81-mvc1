<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.conf.Factory"%>
<%@page import="com.study.jsp.model.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String nickname = request.getParameter("nickname");
	String userid = request.getParameter("userid");

	

	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNickname(nickname);
	dto.setUserid(userid);


	BoardService boardService= Factory.INSTANCE.getBoardService();
    boardService.save(dto);
	
	response.sendRedirect("./list.jsp");
%>