package com.spring.biz.view.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.comment.CommentLikeVO;
import com.spring.biz.comment.CommentVO;
import com.spring.biz.comment.service.CommentService;
import com.spring.biz.movie.ContentsDetailVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.util.StringUtil;
import com.spring.biz.util.getContentInfo;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;


	@Autowired
	private UserService userService;

	// 자바빈(vo) 초기화
	@ModelAttribute
	public CommentVO initCommand() {
		return new CommentVO();
	}

	// =====코멘트 등록=====
	// 코멘트 등록 폼 호출
	@GetMapping(value = "commentWrite.do")
	public String commentform(HttpServletRequest request) {
		return "commentWrite";
	}

	// 코멘트 ajax 등록
	@PostMapping(value = "commentWrite.do")
	@ResponseBody
	public Map<String, String> commentSubmit(CommentVO commentVO, HttpSession session) {
		System.out.println(commentVO+"commentVO확인");
		System.out.println(commentVO.getUserId());
		Map<String, String> map = new HashMap<String, String>();
		Map<String, Object> insert_map = new HashMap<String, Object>();

		
		if (commentVO.getUserId() == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// CommentVO에 회원 번호 셋팅
			commentVO.setUserId(commentVO.getUserId() ); // 코멘트 작성
			insert_map.put("commentVO", commentVO);
			insert_map.put("star_num", commentVO.getStar_num()); // 만약 이미 등록된 별점이 있다면 dcontents_star 테이블에서 해당 star_num을 끌고와서 저장할 예정
			commentService.insertComment(insert_map);
			map.put("result", "success");
		}
		return map;
	}

	// =====코멘트 수정=====
	// 코멘트 수정 폼 호출
	@GetMapping("/board/commentUpdate.do")
	public String commentUpdate(CommentVO commentVO) {
		
		return "commentUpdate";
	}
	
	@RequestMapping("/member/getComment.do")
	@ResponseBody
	public Map<String, String> commentUpdate_member(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		String user_id = (String) session.getAttribute("user_id");
		if (commentVO.getUserId() == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			String content = commentService.getComment(commentVO).getContent();
			map.put("result", "success");
			map.put("content", content);
		}
		return map;
	}

	// 코멘트 ajax 수정
	@RequestMapping(value = {"/board/commentUpdate.do", "/member/commentUpdate.do"})
	@ResponseBody
	public Map<String, String> commentUpdate(CommentVO commentVO, HttpSession session) {
		System.out.println("commentUpdate" + commentVO.getUserId());
		Map<String, String> map = new HashMap<String, String>();
		String user_id = (String) session.getAttribute("user_id");
		if (commentVO.getUserId() == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// 업데이트
			commentVO.setUserId(commentVO.getUserId());;
			commentService.updateComment(commentVO);
			map.put("result", "success");
		}
		return map;
	}

	// 코멘트 ajax 삭제
	@RequestMapping(value = {"/contents/commentDelete.do","/member/commentDelete.do"})
	@ResponseBody
	public Map<String, String> commentDelete(CommentVO commentVO, HttpSession session) {

		Map<String, String> map = new HashMap<String, String>();

		String user_id = (String) session.getAttribute("user_id");
		if (commentVO.getUserId() == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			// 삭제
			commentVO.setUserId(commentVO.getUserId());
			commentService.deleteComment(commentVO);
			map.put("result", "success");
		}
		return map;
	}

	// 내가 쓴 코멘트 목록
	@RequestMapping("/member/myComment.do")
	public ModelAndView myComment(String UserId, HttpSession session) {
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		commentList = commentService.selectListByUserId(UserId); // 내가 작성한 코멘트 목록 불러오기

		getContentInfo util = new getContentInfo();
		List<ContentsDetailVO> contentsList = new ArrayList<ContentsDetailVO>();
		
		String user_id = (String) session.getAttribute("user_id");
		List<Integer> checkCmtLike = new ArrayList<Integer>();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myComment");
		
		for (int i = 0; i < commentList.size(); i++) {
			ContentsDetailVO contents = new ContentsDetailVO();
			contents = util.getInfoDetail(commentList.get(i).getContents_type(), commentList.get(i).getContents_num()); // 영화 상세정보 불러오기
			contentsList.add(contents);
			Integer countLike = commentService.getCountLike(commentList.get(i).getComment_num()); // 코멘트 좋아요 갯수
			if (countLike != null) {
				commentList.get(i).setCountLike(countLike); // 각각의 코멘트의 좋아요 갯수
			}
			if (user_id != null) {
				if (user_id != UserId) { // 타유저 프로필 열람시
					CommentVO comment = new CommentVO();
					comment.setComment_num(commentList.get(i).getComment_num());
					comment.setUserId(user_id);
					checkCmtLike.add(commentService.checkCmtLike(comment)); // 타유저의 코멘트의 좋아요 기등록 여부 확인
					mav.addObject("checkCmtLike", checkCmtLike);
					
				}
			} 
			
		}

		UserVO member = userService.findMemberById(UserId);
		String name = member.getName();
		mav.addObject("name", name); // 타유저 프로필 열람시 타이틀 변경을 위해
		
		mav.addObject("commentList", commentList);
		mav.addObject("contentsList", contentsList);
		return mav;
	}

	// 내가 좋아요 한 코멘트 목록
	@RequestMapping("/member/likeComment.do")
	public ModelAndView likeComment(String UserId, HttpSession session) {
		List<CommentLikeVO> cmtLikeList = commentService.selectListLikeByUserId(UserId); // 내가 좋아요 한 코멘트 목록 불러오기
		
		getContentInfo util = new getContentInfo();
		List<ContentsDetailVO> contentsList = new ArrayList<ContentsDetailVO>();
		List<UserVO> memberList = new ArrayList<UserVO>();
		
		String user_id = (String) session.getAttribute("user_id");
		List<Integer> checkCmtLike = new ArrayList<Integer>();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("likeComment");
		
		for (int i = 0; i < cmtLikeList.size(); i++) {
			ContentsDetailVO contents = new ContentsDetailVO();
			contents = util.getInfoDetail(cmtLikeList.get(i).getContents_type(), cmtLikeList.get(i).getContents_num()); // 영화 상세정보 불러오기
			contentsList.add(contents);
			UserVO member = new UserVO();
			member = userService.findMemberById(cmtLikeList.get(i).getComment_user()); // 내가 좋아요 한 코멘트의 작성자 상세정보 불러오기
			memberList.add(member);
			
			Integer countLike = commentService.getCountLike(cmtLikeList.get(i).getComment_num()); // 코멘트 좋아요 갯수
			if (countLike != null) {
				cmtLikeList.get(i).setCountLike(countLike); // 각각의 코멘트의 좋아요 갯수
			}
			if (user_id != null) {
				if (user_id != UserId) { // 타유저 프로필 열람시
					CommentVO comment = new CommentVO();
					comment.setComment_num(cmtLikeList.get(i).getComment_num());
					comment.setUserId(user_id);
					checkCmtLike.add(commentService.checkCmtLike(comment)); // 타유저가 좋아요 한 코멘트의 좋아요 기등록 여부 확인
					mav.addObject("checkCmtLike", checkCmtLike);
				}
			} 
		}
		UserVO userVO = userService.findMemberById(UserId);
		String name = userVO.getName();
		mav.addObject("name", name); // 타유저 프로필 열람시 타이틀 변경을 위해
		
		mav.addObject("cmtLikeList", cmtLikeList);
		mav.addObject("contentsList", contentsList);
		mav.addObject("memberList", memberList);
		mav.addObject("UserId", UserId);
		
		return mav;
	}

}
