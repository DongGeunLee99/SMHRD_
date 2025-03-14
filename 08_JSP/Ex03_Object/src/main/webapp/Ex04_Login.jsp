<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html에서 넘어오는 id pw를 꺼내와 로그인이 가능한지 체크 -->
	<%
	//1. 요청으로부터 데이터 꺼내오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	//2. 꺼내온 데이터가 로그인할 수 있는 정보와 일치한지 판단
	// 성공 조건 smart / 123
	if (id.equals("ddgg") && pw.equals("123")){
		
		//3. 판단 여부에 따라 성공, 실패 페이지로 이동
		
		// +) sendRedirect를 사용하여 데이터 전달
		// response.sendRedirect("Ex04_Success.jsp?id="+id);
		
		// +) 새로운 데이터 전달 방식! => 포워드(forward)방식
		// ==> url에 전달 데이터를 담지 않고 요청 객체에 전달 데이터를 담는 방식
		RequestDispatcher rd = request.getRequestDispatcher("Ex04_Success.jsp");
		
		request.setAttribute("id", id); //(이름, 값)
		
		rd.forward(request, response);
		
		
		
	}else{
		response.sendRedirect("Ex04_Fail.jsp");
	}
	
	%>
</body>
</html>