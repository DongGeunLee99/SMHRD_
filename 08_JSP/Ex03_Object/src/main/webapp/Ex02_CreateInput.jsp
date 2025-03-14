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
		<legend>랜덤 뽑기</legend>
		<form action="Ex02_RandomOutput.jsp">
			주제 : <input type="text" name="topic"><br>
			<% 
			int num = Integer.parseInt(request.getParameter("num"));
			for(int i = 0; i < num; i++){ %>
				아이템 : <input type="text" name="items"><br>
			<%}%>
			
			<input type="submit" value="생성하기">
		</form>
	</fieldset>
</body>
</html>