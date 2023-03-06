package com.spring.biz.support.faq;

import java.util.List;

import com.spring.biz.support.util.SearchCriteria;

public interface FaqBoardDAO {
	
	// 게시글 전체 개수
	public int getBoardCount(SearchCriteria criteria);
	
	// 게시글 조회
	public FaqBoardVO getBoardById(int boardId);
	
	// 게시글 목록
	public List<FaqBoardVO> getBoardList(SearchCriteria criteria);
	
	// 게시글 작성
	public void insertBoard(FaqBoardVO faqBoardVO);
	
	// 게시글 수정
	public void updateBoard(FaqBoardVO faqBoardVO);
	
	// 게시글 삭제
	public void deleteBoard(int boardId);

}
