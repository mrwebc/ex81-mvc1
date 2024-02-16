<%@page import="com.study.jsp.srv.UserService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.study.jsp.ioc.Factory"%>
<%@page import="com.study.jsp.model.UserDTO"%>

<!-- 로그인 승인을 처리하는 로직 -> 화면디자인이(View가) 필요없다. -->

<%
	//filter를 적용하여 아래 코드 생략함
	//request.setCharacterEncoding("utf-8");    

    //사용자가 입력한 데이터 수신
    String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
    Map<String, String> loginInfo = new HashMap<String, String>();
    loginInfo.put("userid",userid);
    loginInfo.put("userpw",userpw);
    
    /*
	    select * from user where userid=#{userid} and password=#{password}
	    위의 쿼리문을 dao가 mybatis를 이용해서 실행 -> 결과리턴 UserVO
	    
	    srv객체가 dao를 통해서 조회부탁
	    
	    컨트롤러에서 srv에 loginInfo를 넘기면서 부탁
	*/
    
    //DB에 조회요청
    //어떤서비스객체.메소드(loginInfo);
    UserService userService = Factory.INSTANCE.getUserService();
    UserDTO dto = userService.getOne(loginInfo);
	
	if(dto != null) {//로그인 성공
		session.setAttribute("userid", dto.getUserid());
		session.setAttribute("name", dto.getName());
    
		/*
		  sendRedirect()의 기준(루트)은 http://localhost:8090 까지 이므로 아래의 세가지 방법이 가능하다.      
		  만약 설정해도 반영이 안될 경우는 Project>Clean 을 하면 해결된다.
		    1. response.sendRedirect("/jsp_mvc2/listCtrl");
		    2. response.sendRedirect(request.getContextPath() + "/listCtrl");
		    3. response.sendRedirect("./listCtrl");  
		*/ 
		response.sendRedirect("./list.jsp");
		
	}else{//로그인 실패
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
%>