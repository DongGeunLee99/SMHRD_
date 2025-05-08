package kr.bigdata.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// 수많은 기능을 내포하고 있는 annotation
// 그 중 중요한 것들만 한 번 봐보자
// 1) @ComponentScan
//		: @Controller / @RestController / @Service / @Repository 클래스 파일들을
//			자동으로 스캔해서, 메모리에 저장하는 역할
// 2) @SpringBootConfiguration : 스프링 부트 환경 설정 해주는 역할 (application.properties)
// 3) @EnableAutoConfiguration : 일반적인 환경 설정 파일이 아닌 다른 역할을 하는 클래스 파일들을 설정해주는 역할
//      -> 파일 업로드 기능 (MultipartRequest)
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		
	}

}
