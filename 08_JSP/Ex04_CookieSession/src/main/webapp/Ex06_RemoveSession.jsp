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
	/*
	session.removeAttribute("id");
	session.removeAttribute("age");
	*/
	
	// remove()를 사용하지 않고 삭제하는 법
	session.invalidate();
	
	%>
	
	<a href="Ex05_GetSession.jsp">세션 확인</a>
</body>
</html>