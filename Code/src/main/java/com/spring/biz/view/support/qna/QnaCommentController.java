package com.spring.biz.view.support.qna;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.support.qna.QnaBoardService;
import com.spring.biz.support.qna.QnaBoardVO;
import com.spring.biz.support.qnaCmt.QnaCommentService;
import com.spring.biz.support.qnaCmt.QnaCommentVO;
import com.spring.biz.user.UserVO;

@Controller
@RequestMapping("/support/qna/comment")
public class QnaCommentController {

	private final QnaCommentService qnaCommentService;
	private final QnaBoardService qnaBoardService;

	public QnaCommentController(QnaCommentService qnaCommentService, QnaBoardService qnaBoardService) {
		this.qnaCommentService = qnaCommentService;
		this.qnaBoardService = qnaBoardService;
	}
	
	@GetMapping
	public QnaCommentVO getCommentList(@RequestParam("boardId") int boardId, Model model) {
		QnaCommentVO comment = qnaCommentService.getCommentByBoardId(boardId);
		model.addAttribute("comment", comment);
		return comment;
	}

	// 댓글 작성
	@PostMapping("write")
	public String insertComment(QnaCommentVO qnaCommentVO, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("User");
		if (user.getRole().equals("관리자")) {
			qnaCommentService.insertComment(qnaCommentVO);
		}

		return "redirect:/support/qna/" + qnaCommentVO.getBoardId();
	}
	
	// 댓글 수정 폼
	@GetMapping("{commentId}/edit")
	public String editCommentForm(@PathVariable("commentId") int commentId, Model model) {
		QnaCommentVO comment = qnaCommentService.getCommentByCommentId(commentId);
		QnaBoardVO board = qnaBoardService.getBoard(comment.getBoardId());
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		return "/support/qna/qnaBoardCmtEdit";
	}

	// 댓글 수정
	@PostMapping("edit")
	public String editComment(@ModelAttribute QnaCommentVO qnaCommentVO) {
		System.out.println("1: " + qnaCommentVO.getCommentId());
		System.out.println("2: " + qnaCommentVO.getContent());
		qnaCommentService.updateComment(qnaCommentVO);
		return "redirect:/support/qna/" + qnaCommentVO.getBoardId();
	}

	// 댓글 삭제
	@PostMapping("{commentId}/delete")
	public String deleteComment(@PathVariable("commentId") int commentId) {
		QnaCommentVO qnaCommentVO = qnaCommentService.getCommentByCommentId(commentId);
		System.out.println(qnaCommentVO);
		qnaCommentService.deleteComment(qnaCommentVO);
		return "redirect:/support/qna";
	}

}
