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
	// 쿠키의 저장 위치 => 클라이언트
	// 쿠키의 내용을 가져올때에는 데이터값만 가져오지 못함 => 이름과 데이터값을 같이 가져옴
	Cookie[] cookies = request.getCookies();
	// 반복문을 사용하여 전체 쿠키값 가져오기
	for(Cookie c : cookies){ // 배열의 타입으로 가져오기
		out.print(c.getName() + " / "+c.getValue()+"<br>");
	}
	%>
</body>
</html>