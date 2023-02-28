package com.spring.biz.view.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.comment.CommentVO;
import com.spring.biz.comment.service.CommentService;
import com.spring.biz.contents.service.ContentsService;
import com.spring.biz.like.LikeVO;
import com.spring.biz.like.StarVO;

@Controller
public class ContentsAjaxController {

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CommentService commentService;

	// 별점 등록,수정
	@RequestMapping("/board/starRating.do")
	@ResponseBody
	public Map<String, Object> starRating(HttpSession session, StarVO starVO, int checkComment) {
		System.out.println(starVO.getUserId());
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> insert_map = new HashMap<String, Object>();
		// 해당 컨텐츠 평가기록 있나 확인
		int checkStar = contentsService.CheckStar(starVO);

	
		
		if (starVO.getUserId() == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			if (checkStar == 1) { // 별점기록있으면 update
				contentsService.updateStar(starVO);
				map.put("result", "success2");
			} else { // 별점기록없으면 insert
				insert_map.put("starVO",starVO);
				insert_map.put("checkComment",checkComment); // 같은 컨텐츠에 코멘트를 작성한 적이 있는지 확인용
				contentsService.insertStar(insert_map);
				starVO.setUserId(starVO.getUserId());
				contentsService.getStar(starVO); 
				map.put("star_num", contentsService.getStar(starVO).getStar_num()); // ajax통신이라 새롭게 생긴 star_num이 안넘어가서 강제로 넘겨줌
				map.put("result", "success");
			}
		}
		return map;
	}

	// 별점 취소
	@RequestMapping("/board/resetRating.do")
	@ResponseBody
	public Map<String, String> resetRating(HttpSession session, StarVO starVO) {
		Map<String, String> map = new HashMap<String, String>();

		String user_id = (String) session.getAttribute("user_id");
		
		if (user_id == null) {// 로그인이 되지 않은 경우
			map.put("result", "logout");
		} else {// 로그인 된 경우
			contentsService.deleteStar(starVO);
			map.put("result", "success");
		}
		return map;
	}

	// 보고싶어요
	@RequestMapping("/board/contentsLike.do")
	@ResponseBody
	public Map<String, String> contentsLike(HttpSession session, LikeVO like, @RequestParam int check) {
			System.out.println("board/contetsLike.do");
		Map<String, String> map = new HashMap<String, String>();

		String user_id = (String) session.getAttribute("user_id");
		
		if (user_id == null) {
			map.put("result", "logout");
		} else {
			if (check == 1) { // 이미 보고싶어요 등록이 되어 있는 상태일 경우
				contentsService.cancelLike(like); // 한번 더 누르면 취소
				map.put("result", "cancel");
			} else {
				contentsService.contentsLike(like);
				map.put("result", "success");
			}
		}
		return map;
	}

	// 코멘트 좋아요
	@RequestMapping(value = {"board/cmtLike.do", "member/cmtLike.do"})
	@ResponseBody
	public Map<String, Object> commentLike(HttpSession session, CommentVO comment, int checkCmtLike) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String user_id = (String) session.getAttribute("user_id");
		
		if (user_id == null) {
			map.put("result", "logout");
		} else {
			if (checkCmtLike == 1) { // 이미 코멘트에 좋아요를 누른 상태일 경우
				commentService.cancelCmtLike(comment); // 한번 더 누르면 취소
				map.put("result", "cancel");
			} else {
				commentService.commentLike(comment);
				map.put("result", "success");
			}
			
			Integer countLike = commentService.getCountLike(comment.getComment_num()); // 좋아요 갯수 반영을 위함
			
			if (countLike == null) {
				countLike = 0;
			}
			map.put("countLike", countLike);
		}
		return map;
	}

}
