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
	
	// 데이터 저장
	pageContext.setAttribute("name", "value");

	// 데이터 호출
	String name_ = (String) pageContext.getAttribute("name");

	%>
	EL표기 : ${ name }<br>
	<!-- EL표기법은 변수명을 사용하는게 아닌 실제 저장된 이름값을 사용하는 기법
	${ pageScope.name } == ${ 영역의 이름.저장이름 } => 생략 => ${ 저장이름 }
	 -->
	표현식 : <%= name_ %><br><br>
	<a href="Ex01_page2.jsp">페이지 이동</a>
</body>
</html>