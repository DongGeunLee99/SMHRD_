package kr.bigdata.web.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@EnableWebSocket // 웹 소켓 사용
@Configuration // 어플리케이션이 읽어서 미리 객체를 생성할 수 있게 하기 위함
public class WebSocketConfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		registry.addHandler(new WebSocketHandler(), "/websocket").setAllowedOrigins("*");
		// setAllowedOrigins 동일출처정책에 대한 설정
		// * -> 출처가 동일하지 않아도, 전부 승인
		
		
	
	
	
	}
	

}
