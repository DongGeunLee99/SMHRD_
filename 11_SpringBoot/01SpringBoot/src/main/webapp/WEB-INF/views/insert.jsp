<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cpath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
		<h1>게시판</h1>
	</div>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">게시판리스트</div>
			<div class="panel body">
				<form action="${cpath}/goInsert" method="post">
					<table class="table table-condensed">
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writer" class="form-control"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" class="form-control"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" class="form-control" rows="20"
									style="resize: none;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="btn btn-success">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
