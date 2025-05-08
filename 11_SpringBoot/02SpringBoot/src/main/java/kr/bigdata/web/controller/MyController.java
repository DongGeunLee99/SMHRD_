package kr.bigdata.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bigdata.web.entity.Board;
import kr.bigdata.web.entity.SearchCriteria;
import kr.bigdata.web.mapper.BoardMapper;

@Controller
public class MyController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private BoardMapper mapper;

	@GetMapping("/")
	public String goHome(Model model) {

		List<Board> boardList = mapper.selectAll();

		model.addAttribute("boardList", boardList);

		return "board";
	}

	@GetMapping("/goBoardContent/{idx}")
	public String goBoardContent(@PathVariable int idx, Model model) {

		Board boardOne = mapper.selectOne(idx);
		model.addAttribute("boardOne", boardOne);

		return "boardContent";

	}

	@GetMapping("/updateBorad")
	@ResponseBody
	public boolean countUp(@RequestParam int idx, int cnt) {

		return mapper.countUp(cnt, idx);
	}

	@PostMapping("/")
	public String goHome(SearchCriteria criteria, Model model) {
		logger.info("검색 기준 수집" + criteria);
		List<Board> selectBoard = mapper.selectData(criteria);
		model.addAttribute("boardList", selectBoard);
		logger.info("리스트 친구들" + selectBoard);
		return "board";
	}

	@GetMapping("/goInsert")
	public String goInsert() {
		logger.info("insert");

		return "insert";
	}

	@PostMapping("/goInsert")
	public String goInsert(Board board) {
		logger.info("board" + board);
		boolean OKOK = mapper.upDate(board);
		logger.info("upDate" + OKOK);
		return "redirect:/";
	}

	@GetMapping("/delete/{idx}")
	public String dele(@PathVariable int idx) {
		boolean OKOK = mapper.del(idx);
		return "redirect:/";
	}

	@GetMapping("/exrttr")
	public String delea(RedirectAttributes rttr) {
		rttr.addAttribute("message", "message");
		return "redirect:/";
	}

	@GetMapping("/goFile")
	public String goFile() {
		return "uploadFile";
	}

	@PostMapping("/goFile")
	public String goFile(MultipartFile file) throws IllegalStateException, IOException {

		// 0. 파일의 이름 중복 제거하기
		UUID uuid = UUID.randomUUID();
		
		// 1. 파일의 이름 가져오기
		String fileName = uuid.toString() + "__" + file.getOriginalFilename();
		logger.info("filename  : " + fileName);
		
		// 2. 파일 업로드 하기 (직접 코드 작성하기)
		
		// 2-1. 파일 업로드 경로 잡기
//		String path =
//				"C:\\Users\\smhrd\\Documents\\workspace-spring-tools-for-eclipse-4.30.0.RELEASE\\02SpringBoot\\src\\main\\webapp\\upload\\";
		// 2-2. 파일 업로드
		file.transferTo(new File(fileName));
		
		return "redirect:/";
	}
	
	@GetMapping("/goChat")
	public String goChat() {
		return "chat";
	}
	

}
