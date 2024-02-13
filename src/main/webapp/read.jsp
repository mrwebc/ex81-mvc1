<%@page import="com.study.jsp.srv.BoardService"%>
<%@page import="com.study.jsp.conf.Factory"%>
<%@page import="com.study.jsp.model.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int seq = 0;
  String seq_ = request.getParameter("seq");
  if(!seq_.isEmpty()){
    seq = Integer.valueOf(seq_);
  }

  BoardService boardService = Factory.INSTANCE.getBoardService(); 
  BoardDTO dto = boardService.getOne(seq);  
  
  request.setAttribute("dto",dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
</head>

<body>
    <div id="wrap">
        <h1>상세게시글</h1>
        <p>${name}님 환영합니다.</p>
        
        <form action="./editCtrl.jsp" method="post">
            <input type="hidden" name="seq" value="${dto.seq}" />
            <fieldset>
                <legend>글내용</legend>
                <table>
                   <tbody>
                        <tr>
                            <th scope="row"><label for="title">제목</label></td>
                            <td>
                                <input type="text" id="title" name="title" value="${dto.title}"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">닉네임</th>
                            <td>${dto.nickname}</td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="content">내용</label></th>
                            <td>
                                <textarea name="content" cols="40" rows="10">${dto.content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">등록일</th>
                            <td>${dto.regdate}</td>
                        </tr>
                        <tr>
                            <th scope="row">조회수</th>
                            <td>${dto.cnt}</td>
                        </tr>
                   </tbody>
                </table>                
            </fieldset>
            <p><button>글수정</button></p>
        </form>
        <p>
            <a href="./write.jsp">글등록</a> <br />
            <a href="./deleteCtrl.jsp?seq=${dto.seq}">글삭제</a> <br />
            <a href="./list.jsp">글목록</a>        
        </p>
    </div>

</body>
</html>










