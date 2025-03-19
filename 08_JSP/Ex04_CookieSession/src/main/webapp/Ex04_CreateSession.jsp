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
	// Cookie는 생성 -> 객체 사용
	// Session -> JSP 내장 객체
	
	// Session은 숫자도 들어감, 띄어쓰기 가능
	session.setAttribute("id", "smhrd");
	session.setAttribute("age", 200);
	session.setAttribute("address", "광주 남구 송암동");
	
	session.setAttribute("id", "value");
	%>
	
	<a href="Ex05_GetSession.jsp">세션 확인</a>
</body>
</html>