<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.ioc.Factory"%>
<%@page import="com.study.jsp.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    //list.jsp는 로그인한 사용자만 접근 가능하도록 설정
    if(session.getAttribute("userid") == null) {
	/*
	  sendRedirect()의 기준(루트)은 http://localhost:8090 까지 이므로 아래의 세가지 방법이 가능하다.      
	  만약 설정해도 반영이 안될 경우는 Project>Clean 을 하면 해결된다.
	    1. response.sendRedirect("/jsp_mvc2/listCtrl");
	    2. response.sendRedirect(request.getContextPath() + "/listCtrl");
	    3. response.sendRedirect("./listCtrl");  
	*/ 
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }

    BoardService boardService = Factory.INSTANCE.getBoardService();
    List<BoardDTO> list = boardService.findAll();
    
    request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>

<body>
    <div id="wrap">
        <h1>글목록</h1>
        <p>${name}님 환영합니다~!</p>

        <table style="text-align:center;">
          <caption>Model-1 게시판</caption>
          <colgroup>
            <col />
            <col />
            <col style="width:100px;" />
            <col style="width:100px"/>
            <col style="width:70px"/>
          </colgroup>
          <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">닉네임</th>
                <th scope="col">등록일</th>
                <th scope="col">조회수</th>
            </tr>   
          </thead>
          <tbody>
              <c:forEach items="${list}" var="dto">

                <tr>
                    <td>${dto.seq}</td>
                    <td><a href="read.jsp?seq=${dto.seq}">${dto.title}</a></td>
                    <td>${dto.nickname}</td>
                    <td>${dto.regdate}</td>
                    <td>${dto.cnt}</td>
                </tr>

              </c:forEach>
          </tbody>
        </table>
        <p><a href="./write.jsp">새글 등록</a></p> 
    </div>
</body>
</html>



