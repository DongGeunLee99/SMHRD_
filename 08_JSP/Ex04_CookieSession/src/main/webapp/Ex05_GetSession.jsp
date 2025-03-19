<%@page import="javax.websocket.Session"%>
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
	
	// session의 반환 타입은 object로 변수에 저장시 형변환이 필수적으로 필요
	String id = (String) session.getAttribute("id");
	Integer age = (Integer) session.getAttribute("age");
	String address = (String) session.getAttribute("address");
	
	%>
	
	id : <%= id %><br>
	age : <%= age %><br>
	address : <%= address %><br>
	
	<a href = "Ex06_RemoveSession.jsp">세션 삭제하기</a>
	
</body>
</html>