package com.spring.biz.board;

import java.util.List;

import com.spring.biz.CntHistory.CntHistoryVO;

public interface BoardService {

	// 글 등록
		public void insertBoard(ReviewBoardVO vo);
		
		// 글 수정
		public void updateBoard(ReviewBoardVO vo);
			
		// 글 삭제
		public void deleteBoard(ReviewBoardVO vo);

		// 글 상세 조회
		public ReviewBoardVO getBoard(ReviewBoardVO vo);
		
		// 자유게시판 검색
	

		
		// 글 목록 조회
		public List<ReviewBoardVO> getBoardList(ReviewBoardVO vo);
		
		public CntHistoryVO getCntBoard(CntHistoryVO cvo);
		
		public void insertCntHistory(CntHistoryVO cvo);
		public void updateCnt(ReviewBoardVO vo);
		
		// 메인페이지 인기 리뷰
		public List<ReviewBoardVO> getBoardListMain(ReviewBoardVO vo);
		
		public int getSeq();
		
		// 글 목록 조회
		public int getTotalPages(ReviewBoardVO vo);
		
		public List<ReviewBoardVO> cgetBoardList(ReviewBoardVO vo);

		// 글 목록 조회 with paging
		public List<ReviewBoardVO> getBoardListWithPaging(SearchCriteria cri);

		// 글 목록 조회 with dynamic(search condition) paging
		public List<ReviewBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri);
		
		// 리뷰 검색 
		public List<ReviewBoardVO> getSearchReview(ReviewBoardVO vo);
		
		// 자유게시판 검색
		public List<ReviewBoardVO> getSearchFree(ReviewBoardVO vo);
		
		public void reportUpdateReviewY(ReviewBoardVO vo);
		public void reportUpdateReviewN(ReviewBoardVO vo);
		public void updateReviewLike(ReviewBoardVO vo);
		public void updateReviewLikeCancel(ReviewBoardVO vo);
}
