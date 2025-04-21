package com.smhrd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.db.MemberMapper;
import com.smhrd.model.MemberDTO;

@Controller // POJO : 순수 자바로만 만들어지는 파일
public class MemberController {

	@Autowired // 스스로 의존 객체를 찾아주는 Annotation
	MemberMapper mapper;	
	
	@RequestMapping("/")
	public String main() {
		return "Main";
	}
	
	// 새로운 요청을 연결 => 회원가입
	// 요청의 방식 => Get, Post
	@PostMapping("/join")
	public String join(Model model, MemberDTO dto) {
		
		// 회원가입을 위한 정보를 DB로 넘겨주는 기능 호출
		mapper.join(dto);
		
		// 회원가입에 대한 정보를 가지고 JoinSuccess.jsp로 이동
		// Model 객체를 사용하여 해당 정보 전달
		model.addAttribute("email", dto.getEmail());
		
		return "JoinSuccess";
	}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session, Model model) {
		
		MemberDTO info = mapper.login(dto);
		
		session.setAttribute("info", info);
//		model.addAttribute("dto", dto);
		
		return "Main";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("info");
		
		return "Main";
	}
	
	@GetMapping("/goMain")
	public String goBoardMain() {
		return "Main";
	}
	
	@GetMapping("/update")
	public String update(HttpSession session) {
				
		return "UpdateMember";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(MemberDTO dto, HttpSession session) {
		
		mapper.updateMember(dto);
		session.setAttribute("info", dto);
		return "Main";
	}
	
	@GetMapping("/showMember")
	public String showMember(Model model) {
		ArrayList<MemberDTO> list =  mapper.showMember();
		
		model.addAttribute("list", list);
		
		return "ShowMember";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("email") String email) {
		// @RequestParam은 QuretString 문법으로 요청되는 데이터를 꺼내오는 Annotation
		// 꺼내온 이후에는 보관할 수 있는 변수를 함께 지정해야 한다
		
		mapper.delete(email);
		
		return "redirect:showMember";
	}
	/*
	// 비동기 통신을 위한 요청값 받기
	@GetMapping("/checkEmail")
	public @ResponseBody int checkEmail(@RequestParam("checkEmail") String email) {
		MemberDTO dto = mapper.checkEmail(email);
		if (dto == null) { // email이 사용 가능할 경우
			return 0;
		} else { // email이 사용 불가할 경우
			return 1;
		}
	}
	*/
}
