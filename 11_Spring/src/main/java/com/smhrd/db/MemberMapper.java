package com.smhrd.db;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.model.MemberDTO;

@Mapper
public interface MemberMapper {
	// 실제로 데이터베이스와 연결되어 실행할 sql을 전달해주는 클래스
	public int join(MemberDTO dto);
		// join과 연결된 sql 구분 실행 파일인 xml 실행
	public MemberDTO login(MemberDTO dto);
		
	public void updateMember(MemberDTO dto);
	
	public ArrayList<MemberDTO> showMember();

	public void delete(String email);

	public MemberDTO checkEmail(String email);
}
