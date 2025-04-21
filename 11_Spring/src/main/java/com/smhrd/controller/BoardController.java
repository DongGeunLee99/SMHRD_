package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.db.BoardMapper;
import com.smhrd.model.BoardDTO;

@Controller
public class BoardController {

	// DB 작업을 수행할 수 있는 Mapper에 대한 의존성 연결 필요
	@Autowired
	BoardMapper mapper;

	@GetMapping("/goBoardMain")
	public String goBoardMain(Model model) {

		ArrayList<BoardDTO> list = mapper.boardSelect();
		model.addAttribute("list", list);

		return "BoardMain";
	}

	@GetMapping("/boardWrite")
	public String boardWrite() {
		return "BoardWrite";
	}

	@PostMapping("/boardInsert")
	public String boardInsert(HttpServletRequest request, BoardDTO dto) {
		// 1. request
		// 2. 파일 저장 경로 -> save 폴더 사용
		String savePath = request.getSession().getServletContext().getRealPath("resources/save");
		// 3. 파일의 허용 크기 -> 1byte
		int maxSize = 1024 * 1024 * 10;
		// 4. 인코딩 방식
		String encoding = "UTF-8";
		// 5. 파일의 중복 이름을 방지하는 기능 -> 객체 활용
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		try {
			MultipartRequest mlit = new MultipartRequest(request, savePath, maxSize, encoding, rename);

			// from 태그에서 전달하는 데이터 가져오기
			String title = mlit.getParameter("title");
			String writer = mlit.getParameter("writer");
			String filename = mlit.getFilesystemName("filename");
			String content = mlit.getParameter("content");

			System.out.println("filename : " + filename);
			// 가져온 데이터를 관리하기 위해 BoardDTO에 저장
			dto.setTitle(title);
			dto.setWriter(writer);
			dto.setFilename(filename);
			dto.setContent(content);

			// 만들어진 내용을 DB에 전달
			mapper.insert(dto);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/goBoardMain";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("num") int num, Model model) {
		BoardDTO dto = mapper.detail(num);
		model.addAttribute("board", dto);
		return "BoardDetail";
	}

	
	@GetMapping("/delete1")
	public String delete(@RequestParam("num") int num) {
		mapper.delete(num);
		return "redirect:/goBoardMain";
	}
	

}
