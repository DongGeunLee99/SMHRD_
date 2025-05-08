package kr.bigdata.web.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bigdata.web.entity.Board;
import kr.bigdata.web.entity.SearchCriteria;
import kr.bigdata.web.mapper.BoardMapper;

// Controller FC(Dispatcher Servlet)
// Spring conponent scan이 있었는데
@Controller
public class MyController {
	
	// 로그찍는 도구 꺼내오기
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	// Spring container에서 객체를 생성해서 주입하는 형식으로 진행
	// * DI(Dependency Injection)
	@Autowired
	private BoardMapper mapper;
	
	// Spring boot에선 RequestMapping 권장 x
	// 정확하게 전송방식을 지정해주는 형태를 사용
	@GetMapping("/")
	public String goHome(Model model) {
		
		List<Board> boardList = mapper.selectAll();
		
		model.addAttribute("boardList", boardList);
		
		// forward 방식 이동하기
		
		
		return "board";
		// springboot는 기본적으로 접두사 / 접미사
		// 기본값
		// 1) prefix >> resources/templates/
		// 2) suffix >> .html
		// -> html 사용을 권장
	}
	
	@GetMapping("/goBoardContent/{idx}")
	public String goBoardContent(@PathVariable int idx, Model model) {
			
			Board boardOne = mapper.selectOne(idx);
//			logger.info("수집된 데이터 확인 >> " + boardOne + "인덱스는 " + idx);
			model.addAttribute("boardOne", boardOne);
//			logger.info("model" + model);
			
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
	
	
	
	
	
	
	
}
