package com.spring.biz.comment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.comment.CommentLikeVO;
import com.spring.biz.comment.CommentVO;
import com.spring.biz.comment.dao.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;

	/* 코멘트 */

	// 코멘트 작성
	@Override
	public void insertComment(Map<String,Object> map) {
		commentMapper.insertComment(map);
	}

	// 코멘트 작성 여부 확인(1->기록있음,0->기록없음)
	@Override
	public int checkComment(CommentVO comment) {
		return commentMapper.checkComment(comment);
	}

	// 코멘트 수정
	@Override
	public CommentVO getComment(CommentVO comment) {
		return commentMapper.getComment(comment);
	}

	@Override
	public void updateComment(CommentVO comment) {
		commentMapper.updateComment(comment);
	}

	// 코멘트 삭제
	@Override
	public void deleteComment(CommentVO comment) {
		commentMapper.deleteComment(comment);
	}

	// 코멘트 목록 불러오기
	@Override
	public List<CommentVO> selectList(CommentVO comment) {
		return commentMapper.selectList(comment);
	}

	// 코멘트 상세 정보
	@Override
	public CommentVO selectComment(int comment_num) {
		return commentMapper.selectComment(comment_num);
	}

	/* 코멘트 좋아요/댓글 */

	// 코멘트 좋아요
	@Override
	public void commentLike(CommentVO comment) {
		commentMapper.commentLike(comment);

	}

	// 코멘트 좋아요 취소
	@Override
	public void cancelCmtLike(CommentVO comment) {
		commentMapper.cancelCmtLike(comment);
	}

	// 해당 코멘트 좋아요 갯수
	@Override
	public Integer getCountLike(int comment_num) {
		return commentMapper.getCountLike(comment_num);
	}

	// 코멘트 좋아요 여부 확인
	@Override
	public int checkCmtLike(CommentVO comment) {
		return commentMapper.checkCmtLike(comment);
	}

	/* 메인/마이 페이지에서 사용 */

	// 가장 코멘트가 많이 달린 컨텐츠 (메인페이지에서 사용)
	@Override
	public List<CommentVO> getMostCommented(String contents_type) {
		return commentMapper.getMostCommented(contents_type);
	}

	// 내 코멘트 목록
	@Override
	public List<CommentVO> selectListByUserId(String userId) {
		return commentMapper.selectListByUserId(userId);
	}

	// 내가 좋아요한 코멘트 목록
	@Override
	public List<CommentLikeVO> selectListLikeByUserId(String userId) {
		return commentMapper.selectListLikeByUserId(userId);
	}

}
