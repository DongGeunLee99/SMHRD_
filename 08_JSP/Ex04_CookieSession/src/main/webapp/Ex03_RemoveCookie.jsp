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
	// 쿠키 삭제하기 -> 쿠키는 삭제에 대한 객체나 메소드가 존재하지 않는다.
	// 지우고자 하는 쿠키의 이름과 동일한 이름으로 쿠키를 생성 => 유효기간을 짧게 만든다 !
	Cookie cookie = new Cookie("test1", "");
	
	cookie.setMaxAge(0);
	
	response.addCookie(cookie);
	%>
	
	<a href="Ex02_GetCookie.jsp">쿠키 확인하기</a>

</body>
</html>