<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동근</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>빅데이터 게시판</h1>
		<p>스프링 부트를 활용하여, 다 함께 게시판을 만들어 보쟈</p>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<!-- 요청할 url : /web/ , 전송방식 : post -->
				<form class="form-inline" action="${cpath}/" method="post">
					<div class="form-group">
						<label for="sel1">검색 조건:</label>
						<select class="form-control" id="sel1" name="filter">
							<option value="WRITER">작성자</option>
							<option value="TITLE">제목</option>
							<option value="CONTENT">내용</option>
						</select>
					</div>
					<div class="form-group">
						<input name="searchContent" type="text" class="form-control"/>
						<button type="submit" class="btn btn-success" >검색</button>
					</div>
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>조회수</td>
						<td>날짜</td>
					</tr>

					<c:forEach items="${boardList}" var="b">
						<tr>
							<td>${b.idx }</td>
							<td><a href="goBoardContent/${b.idx}">${b.title }</a></td>
							<td>${b.writer }</td>
							<td>${b.count }</td>
							<td><fmt:formatDate value="${b.indate }"
									pattern="yy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>

				</table>
				<button onclick = "location.href='${cpath}/goInsert'" class="btn btn-success" >글추가</button>
			</div>
		</div>
	</div>
</body>
</html>