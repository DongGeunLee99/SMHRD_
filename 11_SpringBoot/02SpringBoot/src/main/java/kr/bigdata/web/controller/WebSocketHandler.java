package kr.bigdata.web.controller;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import jakarta.websocket.server.ServerEndpoint;


@Controller
@ServerEndpoint("websocket") // 소켓으로 들어올 url mapping 값
public class WebSocketHandler extends TextWebSocketHandler{
	
	// 소켓을 통해 접속한 사용자들에 대한 정보를 저장할 자료 구조
	// ConcurrentHashMap
	// HashMap자료구조 (key - value 형태)
	// Concurrent -> 멀티스레드 (여러개의 프로세스가 하나의 자료구조를 활용하는) 환경에 특화되어 있음
	private static ConcurrentHashMap<String, WebSocketSession> clients = new ConcurrentHashMap<>();

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	// 1. 웹 소켓이 열렸을 때, 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("connection 로그 >> " + session);
		// 들어온 사용자를 clients에 추가
		clients.put(session.getId(), session);
		// 소켓에 제대로 접속이 완료되었다면, 사용자에게 데이터 전송
		// 데이터를 전송하는 방법
		// 대상이 되는 사용자 session.sendMessage(new TextMessage());
		session.sendMessage(new TextMessage("success"));
	}

	// 2. 웹 소켓이 텍스트 데이터를 전달 받았을 때, 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("handle 로그 >> " + session);
		logger.info("message 확인 >> " + message.getPayload());
		
		// 나를 제외한 나머지 인원들에게 메시지 전송
		clients.entrySet().forEach(data -> {
			logger.info("꺼내온 데이터 >" + data);
			// data == session
			if (!data.getValue().getId().equals(session.getId())) {
				// 데이터 전송
				// 세션.sendMessage
				try {
					data.getValue().sendMessage(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});
		
	}

	// 3. 웹 소켓이 닫혔을 때, 실행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("close 로그 >> " + session);
		// 사용자의 모든 정보가 들어있는 clients 자료구조에서
		// 해당 사용자를 삭제하는 작업
		clients.remove(session.getId());
	}
	
	
	
}
