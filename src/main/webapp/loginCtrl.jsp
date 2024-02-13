<%@page import="com.study.jsp.srv.UserService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.study.jsp.conf.Factory"%>
<%@page import="com.study.jsp.model.UserDTO"%>
<%
String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
    Map<String, String> loginInfo = new HashMap<String, String>();
    loginInfo.put("userid",userid);
    loginInfo.put("userpw",userpw);
  
    UserService userService = Factory.INSTANCE.getUserService();
    UserDTO dto = userService.getOne(loginInfo);
	
	if(dto != null) {
		session.setAttribute("userid", dto.getUserid());
		session.setAttribute("name", dto.getName());
		
		response.sendRedirect("./list.jsp");
	}else{
		response.sendRedirect("./login.jsp");
	}
%>