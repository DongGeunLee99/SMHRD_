<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상에서 제일 가는 포테토칩</title>
</head>
<body>

	<%
		String name = request.getParameter("name");
		out.print(name+"<br>");
	%>
	<!-- JSP구성 요소 : 지시자, 선언문, 스크립틀릿, 표현식 -->
	<%= name %> <!-- 표현식 -->

</body>
</html>