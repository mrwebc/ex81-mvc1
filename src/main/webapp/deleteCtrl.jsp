<%@page import="com.study.jsp.ioc.Factory"%>
<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //seq 처리 로직
	int seq = 0;

	String seq_ = request.getParameter("seq");
	if(!seq_.isEmpty()){
	  seq = Integer.valueOf(seq_);
	}	

	BoardService boardService = Factory.INSTANCE.getBoardService();
	boardService.delete(seq);
	
	response.sendRedirect("./list.jsp");

%>
