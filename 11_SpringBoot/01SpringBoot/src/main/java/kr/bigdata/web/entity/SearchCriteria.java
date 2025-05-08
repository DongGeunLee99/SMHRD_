package kr.bigdata.web.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchCriteria {

	// 검색 기준을 의미하는 자료형
	private String filter; // 작성자 or 제목 or 내용
	private String searchContent; // 검색한 글자
}
