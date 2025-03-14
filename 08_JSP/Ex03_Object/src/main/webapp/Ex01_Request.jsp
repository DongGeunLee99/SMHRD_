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
	String name = request.getParameter("name");
	int java = Integer.parseInt(request.getParameter("java"));
	int web = Integer.parseInt(request.getParameter("web"));
	int iot = Integer.parseInt(request.getParameter("iot"));
	int and = Integer.parseInt(request.getParameter("and"));
	
	// 정수와 정수가 연산이 되면 정수로 반환이 되므로 4.0으로 정수와 실수로 연산하게 한다
	float avg = (java+web+iot+and)/4.0f;

	String grade = (avg >= 95) ? "A+" :
			   (avg >= 90) ? "A" :
			   (avg >= 85) ? "B+" :
			   (avg >= 80) ? "B" : "F";
	
	%>
	

	<fieldset>
		<legend> 학점 확인 프로그램</legend>
		<table border="1">
			<tr>
				<td>이름</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>Java 점수</td>
				<td><%= java %></td>
			</tr>
			<tr>
				<td>Web 점수</td>
				<td><%= web %></td>
			</tr>
			<tr>
				<td>Iot 점수</td>
				<td><%= iot %></td>
			</tr>
			<tr>
				<td>Android 점수</td>
				<td><%= and %></td>
			</tr>
			<tr>
				<td>평균</td>
				<td><%= avg %></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><%= grade %></td>
			</tr>
		
		</table>
	</fieldset>
</body>
</html>