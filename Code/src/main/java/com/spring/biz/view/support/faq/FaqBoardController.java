package com.spring.biz.view.support.faq;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.support.faq.FaqBoardService;
import com.spring.biz.support.faq.FaqBoardVO;
import com.spring.biz.support.util.PageMaker;
import com.spring.biz.support.util.SearchCriteria;
import com.spring.biz.user.UserVO;

@Controller
@RequestMapping("/support/faq")
public class FaqBoardController {

	private final FaqBoardService faqBoardService;

	@Autowired
	public FaqBoardController(FaqBoardService faqBoardService) {
		this.faqBoardService = faqBoardService;
	}

	// 글 목록
	@GetMapping
	public String getBoardList(SearchCriteria criteria, HttpSession session, Model model) {
		criteria.calculateRowNum();
		PageMaker pageMaker = new PageMaker(criteria, faqBoardService.getBoardCount(criteria));
		List<FaqBoardVO> boardList = faqBoardService.getBoardList(criteria);

		UserVO user = (UserVO) session.getAttribute("User");
		if(user != null && user.getRole().equals("관리자")) {
			model.addAttribute("user", user);
		}

		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMaker);

		return "/support/faq/faqBoardList";
	}

	// 글 작성 폼
	@GetMapping("write")
	public String getWriteForm(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("User");
		
		if(user == null || !user.getRole().equals("관리자")) {
			return "redirect:/";
		}
		
		model.addAttribute("user", user);
		return "/support/faq/faqBoardWrite";
	}

	// 글 작성
	@PostMapping("write")
	public String insertBoard(FaqBoardVO faqBoardVO) {
		faqBoardService.insertBoard(faqBoardVO);
		return "redirect:/support/faq";
	}
	
	// 글 수정 폼
	@GetMapping("{boardId}/edit")
	public String getEditForm(@PathVariable int boardId, Model model) {
		FaqBoardVO board = faqBoardService.getBoardById(boardId);
		if (board == null) {
	        throw new IllegalArgumentException("존재하지 않는 게시글입니다.");
	    }
		
		model.addAttribute("board", board);
		return "/support/faq/faqBoardEdit";
	}

	// 글 수정
	@PostMapping("{boardId}/edit")
	public String updateBoard(@PathVariable int boardId, FaqBoardVO faqBoardVO) {
		faqBoardVO.setBoardId(boardId);
	    faqBoardService.updateBoard(faqBoardVO);
	    return "redirect:/support/faq";
	}

	// 글 삭제
	@PostMapping("{boardId}/delete")
	public String deleteBoard(@PathVariable int boardId) {
	    faqBoardService.deleteBoard(boardId);
	    return "redirect:/support/faq";
	}
}
