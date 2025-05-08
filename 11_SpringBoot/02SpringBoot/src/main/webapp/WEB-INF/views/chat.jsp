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
<title>동근</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
.ChatWrapper {
	width: 100%;
	height: 100%;
}

#Chatting {
	width: 60%;
	height: 400px;
	border: 1px solid gray;
}

#Chatting-send {
	width: 60%;
}

.content {
	width: 100%;
	height: 5%;
}

.my {
	text-align: right;
}

.others {
	text-align: left;
}
</style>


</head>
<body>

	<div class="container">
		<h2>WebSocket Chatting</h2>
		<div class="panel panel-default">
			<div class="panel-heading">채팅구현하기</div>
			<div class="panel-body" align="center">

				<div class="ChatWrapper">
					<div id="Chatting"></div>

					<br>

					<div id="Chatting-send">
						<div class="form-group">
							<label class="control-label col-sm-2" for="nickname">닉네임:</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="nickname"
									placeholder="닉네임입력" name="nickname">
							</div>
							<button id="eCheck" class="btn btn-success col-sm-2">닉네임확정</button>
						</div>
						<br>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">메시지:</label>
							<div class="col-sm-8">
								<textarea placeholder="메시지입력" rows="5" class="form-control"
									id="content" name="content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-info col-sm-2" id="sendMsg" disabled>전송</button>
						</div>
					</div>

				</div>

			</div>
			<div class="panel-footer">빅데이터 분석서비스 개발자과정 - 채수민</div>
		</div>
	</div>



	<script>
		let chectbtn = document.getElementById("eCheck")
		let nickname = document.getElementById("nickname")
		let sendMsg = document.getElementById("sendMsg")
		let content = document.getElementById("content")
		let chattingRoom = document.getElementById("Chatting")
		let websocket;
		
		// 1. 닉네임을 입력, 닉네임 확정 버튼을 누르면
		// 입력한 닉네임을 가져오기
		chectbtn.onclick = function() {
			if (nickname.value != '') {
				// 2. 닉네임을 확정하면 input을 읽기 전용으로 변경
				nickname.readOnly = true;
				// 3. 전송 버튼을 활성화
				/* sendMsg.disabled = false; */
				sendMsg.removeAttribute("disabled");
			}
		}
		
		document.addEventListener("DOMContentLoaded", connection);
		
		function connection() {
			// 웹 소켓 생성
			// ws는 웹 소켓용 프로토콜
			let url = "ws://" + location.host + "${cpath}/websocket";
			websocket = new WebSocket(url);
			
			// 1. 소켓이 열렸을 때 실행
			websocket.onopen = function() {
				console.log("연결 성공");
			}
			// 2. 소켓이 닫혔을 때 실행
			websocket.onclose = function() {
				console.log("연결 실패");
			}
			// 3. 소켓을 사용해서 데이터 전송/수신 실행
			websocket.onmessage = function(e) {
				console.log("메세지 수신");
				// 보내온 데이터를 받아올 때는, 함수의 매개변수로 받아오면 된다.
				// e -> JS형태
				// e.data -> 정확히 우리가 받아와야 하는 data
				console.log("메세지 확인 : " + e.data);
				
				// 만약 받은 데이터가 success라면 채팅방 화면에
				// ===== 채팅방 입장을 환영합니다 ===== 출력하기
				if (e.data === "success"){
					// <div>데이터 추가</div>
					chattingRoom.append("== 채팅방 입장을 환영합니다 ==");
				}else{
					// 다른 사람이 보낸 데이터를 수신할 때
					console.log("else : " + e.data);
					
					// 화면구성 변화
					// 1. display block 속성을 가지고 있는 div 태그 생성
					let div = document.createElement("div");
					// 2. div태그 안쪽에 e.data.content만 꺼내와서 글자고 세팅
					div.innerText = JSON.parse(e.data).content;
					div.className = "others";
					// 3. chattingRoom에 넣기
					chattingRoom.append(div);
				}
				
			}
		}

		
		// 전송 버튼을 눌렀을 때 작동할 함수 생성
		sendMsg.onclick = function() {
			// 닉네임 메시지 내용을 가져오기
			// console.log(nickname.value);
			// console.log(content.value);

			// sendData라는 객체를 만들기
 			let sendData = {
				nickname : nickname.value,
				content : content.value
				};
 

			// nickname : 닉네임 / content : 메시지 내용 값
			console.log("sendData >> " + sendData.nickname + " - " + sendData.content);
			
			
			// java쪽 소켓으로 텍스트 데이터 전송
			// 웹소켓.send(보내줄 데이터) --> json string 변환
			websocket.send(JSON.stringify(sendData));
			
			let div = document.createElement("div");
			div.innerText = sendData.content;
			div.className = "my";
			chattingRoom.append(div);
			
		}
		
		
	</script>



</body>


</html>