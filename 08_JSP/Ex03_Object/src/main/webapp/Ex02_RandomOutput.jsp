<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
<h1>랜덤 당첨 게임</h1>
	<fieldset>
		<legend>랜덤 뽑기 결과</legend>
		<form>
			<%
			String topic = (request.getParameter("topic"));			
			String[] items = request.getParameterValues("items");			
			Random rd = new Random();
			int num = rd.nextInt(items.length);
			%>
			<%= topic %>
			<br>
			<%= items[num] %>
		</form>
	</fieldset>
</body>
</html>