<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id.equals("ddgg") && pw.equals("123")){
		// 로그인 성공시 회원의 이름을 session에 담아서 전달
		session.setAttribute("nick", "동근");
		response.sendRedirect("Ex07_Main.jsp");
	}else{
		response.sendRedirect("Ex07_Loginform.html");
	}
	
	%>
</body>
</html>