package com.spring.biz.support.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.support.util.PageMaker;
import com.spring.biz.support.util.SearchCriteria;
import com.spring.biz.user.UserVO;

@Controller
@RequestMapping("support/qna")
public class QnaBoardController {

	private final QnaBoardService qnaBoardService;
	private final FileUploadService fileUploadService;

	// 생성자
	@Autowired
	public QnaBoardController(QnaBoardService qnaBoardService, FileUploadService fileUploadService) {
		this.qnaBoardService = qnaBoardService;
		this.fileUploadService = fileUploadService;
	}
	
	// 글 목록 조회
	@GetMapping
	public String getBoardList(SearchCriteria criteria, HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("User");
		String userId = user.getUserId();
		String role = user.getRole();
		criteria.calculateRowNum();
		
		PageMaker pageMaker = null;
		List<QnaBoardVO> boardList = null;
		
		if (role.equals("관리자")) {
			pageMaker = new PageMaker(criteria, qnaBoardService.getBoardCount());
			boardList = qnaBoardService.getBoardList(criteria);
		} else if (role.equals("사용자")) {
			pageMaker = new PageMaker(criteria, qnaBoardService.getMyBoardCount(criteria, userId));
			boardList = qnaBoardService.getMyBoardList(criteria, userId);
		}
		
		pageMaker.setCriteria(criteria);
		model.addAttribute("board", boardList);
		model.addAttribute("pageMaker", pageMaker);
		return "/support/qna/qnaBoardList";
		
	}

	// 글 작성 폼
	@GetMapping("/write")
	public String getWriteForm(UserVO userVO, HttpSession session, Model model) {
		addUserToModelFromSession(session, model);
		return "support/qna/qnaBoardWrite";
	}

	// 글 작성 처리
	@PostMapping("/write")
	public String insertBoard(UserVO userVO, QnaBoardVO qnaBoardVO,
			@RequestParam(required = false) List<MultipartFile> files, HttpSession session, Model model) throws Exception {
		addUserToModelFromSession(session, model);
		qnaBoardService.insertBoard(qnaBoardVO);

		if (hasFile(files)) {
			fileUploadService.uploadFile(qnaBoardVO.getBoardId(), files);
		}

		return "redirect:/support/qna/write";
	}

	// 글 조회
	@GetMapping("{boardId}")
	public String getBoard(@PathVariable int boardId, UserVO userVO, Model model, HttpSession session) {
		addUserToModelFromSession(session, model);
		
		QnaBoardVO qnaBoard = qnaBoardService.getBoard(boardId);
		List<FileUploadVO> fileUploads = fileUploadService.getFileUpload(boardId);

		model.addAttribute("board", qnaBoard);
		model.addAttribute("fileUploads", fileUploads);

		return "support/qna/qnaBoardView";
	}

	// 파일 업로드 검증 메소드
	private boolean hasFile(List<MultipartFile> files) {
		return files != null && !files.isEmpty() && !files.get(0).isEmpty();
	}
	
	public void addUserToModelFromSession(HttpSession session, Model model) {
	    UserVO user = (UserVO) session.getAttribute("User");
	    model.addAttribute("user", user);
	}

}
