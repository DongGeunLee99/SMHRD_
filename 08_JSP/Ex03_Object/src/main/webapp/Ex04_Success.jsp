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
	// jsp파일이지만 servlet의 역할 가능
	// => getParameter()를 활용하여 넘어오는 데이터를 꺼내올 수 있다.
	String id = request.getParameter("id");
	%>
	<%=id %>님 환영합니다<br>
	<a href="Ex04_Login.html">로그아웃</a>
</body>
</html>