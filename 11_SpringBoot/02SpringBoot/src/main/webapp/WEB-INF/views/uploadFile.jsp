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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
				<!-- 파일을 업로드 할땐 반드시 form 태그에 enctype >> 전송되는 파일의 형태를 지정 -->
				<form action="${cpath}/goFile" enctype="multipart/form-data" method="post">
					<table class="table table-condensed">
						<tr>
							<th>업로드할 파일</th>
							<td><input type="file" name="file" class="form-control"></td>
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
