<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- taglib에도 여러 종류가 있는데 사용하고자 하는 걸 구분할 수 있도록 작성 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	taglib 지시자 : jsp에서 html태그와 비슷한 코드를 사용하여
					java문법을 사용할 수 있도록 해준다.
					1) jar파일 다운로드 후, web-inf -> lib에 넣어준다.
					2) jsp파일 상단에서 지시자를 이용하여 taglib설정 
	 -->
	 <% for(int i = 1; i<5; i++){ %> 	
        <%= i %>
	 <%} %>
	 <br>
	 <br>
	 <!-- 스크립틀릿과 표현식을 혼용해서 만든 for문을 taglib이용해서 작성 -->
	 <c:forEach var="i" begin="1" end="10" step="1">
	 	<c:out value="${i}"></c:out>
	 </c:forEach>


</body>
</html>