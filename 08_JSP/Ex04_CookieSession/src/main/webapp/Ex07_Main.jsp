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
	String nick = (String) session.getAttribute("nick");
	%>
	<%=nick %>님 환영합니다<br>
	
	<a href="Ex07_Logout.jsp">
		로그아웃
		<%-- <%session.removeAttribute("nick");%> --%>
	</a>
</body>
</html>