package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// => lombok
@Data // getter, setter 연결 Annotation
@AllArgsConstructor // 생성자 메소드를 연결하기 위한 Annotation
@NoArgsConstructor // 기본 생성자 메소드를 연결하기 위한 Annotation
public class MemberDTO {
	private String email;
	private String pw;
	private String tel;
	private String address;
	
}