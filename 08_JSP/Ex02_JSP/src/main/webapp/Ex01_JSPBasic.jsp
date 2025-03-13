<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Random"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 
    JSP 구성요소
    1) 지시자 (Directive)
    	: JSP 파일 설정 정보 지정 및 다른 문서를 포함
    	지시자의 종류 : page, include, taglib
    	contentType : 응답 데이터의 형식과 인코딩 방식을 클라이언트에게 알려주기 위함
    	pageEncoding : JSP페이지에 대한 인코딩 방식 지정
    	charset : html문서에 대한 인코딩 방식
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 
	2) 선언문(declaration)
		: java 메서드, 변수를 선언하기 위해 사용
		java파일에서 사용했던 문법 그대로 적용
		코드 자동완성 안되는 경우 있음
		-> 선언문을 이용한 변수는 전역변수
 	-->
	<%!int num_declaration = 3;%>
	<%!public void printNum() {
	System.out.print("선언문을 이용");
	}%>

	 <!-- 
	 3) 스크립틀릿 (Scriptlet : JSP 페이지 내부에 java코드 삽입)
	 	* 스크립들릿을 이용해서 작성할때는 java를 이용해서
	 	생성한 메서드 내부에 작성한다고 생각
	 	-> 선언문을 이용한 변수는 service메서드 안에서 선언된다 (지역변수)
	 -->

	<%
	int num_SC = 9;
	System.out.print("스크립틀릿 안에서 작성한 출력문");
	
	Random rd = new Random();
	int num_rd = rd.nextInt(10);

	System.out.print("num_rd");
	%>

	<!-- 
	4) 표현식(Expreesion) : 화면에 출력하기 위해 사용
	표현식은 변수를 출력하기 위해서 사용 가능하다!
	-->
	<%= num_declaration %>
	<%= "String" %>
	<%= "빅" + "data" %>
	
	<!-- 
	JSP 파일을 생성해서 코드를 작성한 후 실행하면
	servlet(.java) 변환 -> 컴파일 후, .class 파일로 변환
	webcontainer가 일부 객체는 자동적으로 생성해준다.
	-->
	
	<%out.print("out.print"); %>
	<%out.println("out.println"); %>
	<%out.println("out.print + br <br>"); %>
	<%out.print("out.\tprint"); %>
	 

</body>
</html>