package com.spring.biz.comment.service;

import java.util.List;
import java.util.Map;

import com.spring.biz.comment.CommentLikeVO;
import com.spring.biz.comment.CommentVO;

public interface CommentService {
	/* 코멘트 */
	// 코멘트 작성
	public void insertComment(Map<String,Object> map);

	// 코멘트 작성 여부 확인
	public int checkComment(CommentVO comment);

	public CommentVO getComment(CommentVO comment);

	// 작업중
	public void updateComment(CommentVO comment);

	// 코멘트 삭제
	public void deleteComment(CommentVO comment);

	// 코멘트 목록 불러오기
	public List<CommentVO> selectList(CommentVO comment);

	// 코멘트 상세 정보
	public CommentVO selectComment(int comment_num);

	/* 코멘트 좋아요/댓글 */

	// 코멘트 좋아요
	public void commentLike(CommentVO comment);

	// 코멘트 좋아요 취소
	public void cancelCmtLike(CommentVO comment);

	// 해당 코멘트 좋아요 갯수
	public Integer getCountLike(int comment_num);

	// 코멘트 좋아요 여부 확인
	public int checkCmtLike(CommentVO comment);

	/* 메인/마이 페이지에서 사용 */

	// 가장 코멘트가 많이 달린 컨텐츠 (메인페이지에서 사용)
	public List<CommentVO> getMostCommented(String contents_type);

	// 내 코멘트 목록
	public List<CommentVO> selectListByUserId(String userId);

	// 내가 좋아요 한 코멘트 목록
	public List<CommentLikeVO> selectListLikeByUserId(String userId);
}
