<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
    
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>동근동근</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>
	<body>
	    <div class="jumbotron text-center">
	        <h1>빅데이터 게시판</h1>
	        <p>스프링 부트를 활용하여, 다 함께 게시판을 만들어 보쟈</p>
	    </div>
	    
	    <div class="container">
	        <table class="table table-striped table-bordered">
				    <tr>
				        <th>번호</th>
				        <td>${boardOne.idx}</td>
				        <th>작성자</th>
				        <td>${boardOne.writer}</td>
				    </tr>
				    <tr>
				        <th>작성일</th>
				        <td>
			                <fmt:formatDate value="${boardOne.indate }" pattern="yy-MM-dd HH:mm"/>
		                </td>
				        <th>조회수</th>
				        <td>${boardOne.count}</td>
				    </tr>
				    <tr>
				        <th>제목</th>
				        <td colspan="3">${boardOne.title}</td>	            	
				    </tr>
				    <tr>
				        <th>내용</th>
				        <td colspan="3">${boardOne.content}</td>
				    </tr>
	        </table>
	        <button onclick = "location.href='${cpath}/delete/${boardOne.idx}'" class="btn btn-danger" >삭제</button>
	        <button onclick = "location.href='${cpath}/'" class="btn btn-primary" >홈으로</button>
	    </div>
	    
	    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	    <script>

	    	axios.get('${cpath}/updateBorad', {
	    		params:{
	    			idx : ${boardOne.idx},
	    			cnt : ${boardOne.count} + 1
	    		}
	    	})
	    	.then(res => {
	    		if (res.data == true){
    	    		console.log("성공!")
	    		}else{
    	    		console.log("실패!")	    			
	    		}
			})
			.catch(err => {
	    		console.log("에러!")
			})
	    	
	    </script>
	    
	    
	</body>
	</html>