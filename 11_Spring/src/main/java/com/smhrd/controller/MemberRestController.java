package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.db.MemberMapper;
import com.smhrd.model.MemberDTO;

@RestController
public class MemberRestController {

	// RestController : 비동기 방식을 처리하기 위한 전용 Controller
	// 페이지 이동은 X, 데이터의 결과를 리턴 O
	
	@Autowired
	MemberMapper mapper;
	
	// 비동기 통신을 위한 요청값 받기
	@GetMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(@RequestParam("inputEmail") String email){ 
		MemberDTO dto = mapper.checkEmail(email);
		if (dto == null) { // email이 사용가능할 경우 
			return true; 
		} else { // email이 사용 불가할 경우
			return false;
		}
	}

	

}
