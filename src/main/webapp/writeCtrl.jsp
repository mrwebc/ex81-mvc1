<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.ioc.Factory"%>
<%@page import="com.study.jsp.model.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //사용자가 입력한 데이터 수신
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String nickname = request.getParameter("nickname");
	String userid = request.getParameter("userid");


    //클라이언트가 보내온 데이터를 DTO 패키징 처리
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNickname(nickname);
	dto.setUserid(userid);

    //DB에 조회요청
    //어떤서비스객체.메소드(loginInfo);
	BoardService boardService= Factory.INSTANCE.getBoardService();
    boardService.save(dto);
	
	response.sendRedirect("./list.jsp");
%>