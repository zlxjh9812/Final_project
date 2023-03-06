package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.CntHistory.CntHistoryVO;
import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.board.SearchCriteria;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 글삽입
	public void insertBoard(ReviewBoardVO vo) {
		System.out.println("insertBoard 수행");
		
		mybatis.insert("BoardDAO.insertBoard", vo);
	
	}
	
	// 글 수정
	public void updateBoard(ReviewBoardVO vo) {
		System.out.println("updateBoard 수행");
		
		mybatis.update("BoardDAO.updateBoard",vo);

	}
	
	// 글 삭제
	public void deleteBoard(ReviewBoardVO vo) {
		System.out.println("글 삭제");
		mybatis.update("BoardDAO.deleteBoard", vo);
	}
	
	// 글 상세
	public ReviewBoardVO getBoard(ReviewBoardVO vo) {
		System.out.println("getBoard 기능 수행");
		return (ReviewBoardVO) mybatis.selectOne("BoardDAO.getBoard",vo);
		
	}
	
	// 게시글 조회수
	public CntHistoryVO getCntBoard(CntHistoryVO cvo) {
		System.out.println("조회수 읽기");
		return (CntHistoryVO) mybatis.selectOne("BoardDAO.getCntBoard", cvo);
	}
	
	// 조회수 증가
	public void updateCnt(ReviewBoardVO vo) {
		 System.out.println("조회수 +1");
		 mybatis.update("BoardDAO.updateCnt", vo);
	}
	
	// 조회수 중복 방지
	public void insertCntHistory(CntHistoryVO cvo) {
		mybatis.insert("BoardDAO.insertCntHistory", cvo);
	}
	
	// 게시글 목록 조회
	public List<ReviewBoardVO> getBoardList(ReviewBoardVO vo){
		System.out.println("getBoardList 수행");
		
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	// 게시글 목록 조회
		public List<ReviewBoardVO> cgetBoardList(ReviewBoardVO vo){
			System.out.println("getBoardList 수행");
			
			return mybatis.selectList("BoardDAO.cgetBoardList", vo);
		}
	
	// 메인페이지 리뷰 보드 읽기
	public List<ReviewBoardVO> getBoardListMain(ReviewBoardVO vo){
		System.out.println("메인 getBoardList 수행");
		
		return mybatis.selectList("BoardDAO.getBoardListMain", vo);
	}
	
	// paging
	public int getTotalPages(ReviewBoardVO vo) {

		return mybatis.selectOne("BoardDAO.getTotalPages", vo);
	}

	// 글 목록 조회 with paging
	public List<ReviewBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		
		return mybatis.selectList("BoardDAO.getBoardListWithPaging", cri);
	}
	
	// 리뷰 검색
	public List<ReviewBoardVO> getSearchReview(ReviewBoardVO vo){
	
		return mybatis.selectList("BoardDAO.getSearchReview", vo);
	}
	
	
	// 글 목록 조회 with paging
	public List<ReviewBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
			
		return mybatis.selectList("BoardDAO.getBoardListWithDynamicPaging", cri);
	}
	
	public int getSeq() {
		return mybatis.selectOne("BoardDAO.getSeq");
	}
	
	// 신고 당한 테이블 
	public void reportUpdateReviewY(ReviewBoardVO vo) {
		mybatis.update("BoardDAO.reportUpdateReviewY",vo);
	}
	
	//신고 안당한 테이블
	public void reportUpdateReviewN(ReviewBoardVO vo) {
		mybatis.update("BoardDAO.reportUpdateReviewN",vo);
	}
	
	//리뷰 좋아요
	public void updateReviewLike(ReviewBoardVO vo) {
		mybatis.update("BoardDAO.updateReviewLike",vo);
		
	}
	
	//리뷰 좋아요 취소
	public void updateReviewLikeCancel(ReviewBoardVO vo) {
		mybatis.update("BoardDAO.updateReviewLikeCancel",vo);
		
	}
	
	// 자유게시판 검색
	public List<ReviewBoardVO> getSearchFree(ReviewBoardVO vo){
		
		return mybatis.selectList("BoardDAO.getSearchFree", vo);
	}
}
