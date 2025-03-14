<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 쿠키는 자바 언어를 통해서만 생성할 수 있다 -->
	<%
	// 1. 쿠키 생성 -> Cookie
	// 쿠키를 생성할때는 필수적으로 쿠키 이름과 데이터가 들어가야 한다.
	// => 쿠키의 데이터 타입은 무조건 문자
	// => 데이터 값 자체를 문자로 인코딩하는 과정
	String enc = URLEncoder.encode("Hi Servlet", "UTF-8");
	Cookie cookie = new Cookie("test1", enc);
	
	// 2. 쿠키의 유효기간 설정 -> 초 단위 설정 가능
	cookie.setMaxAge(3600*24*365);
	
	// 3. 생성된 쿠키를 서버에서 클라이언트로 전달
	response.addCookie(cookie);
	
	%>

	<a href="Ex02_GetCookie.jsp">쿠키 확인하기</a>

</body>
</html>