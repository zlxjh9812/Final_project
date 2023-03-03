package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.CntHistory.CntHistoryVO;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.board.SearchCriteria;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	public void insertBoard(ReviewBoardVO vo) {

		boardDAO.insertBoard(vo);
	}

	public void updateBoard(ReviewBoardVO vo) {

		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(ReviewBoardVO vo) {


		boardDAO.deleteBoard(vo);
	}

	public ReviewBoardVO getBoard(ReviewBoardVO vo) {


		return boardDAO.getBoard(vo);
	}

	public List<ReviewBoardVO> getBoardList(ReviewBoardVO vo) {

		return boardDAO.getBoardList(vo);
	}
	
	@Override
	public void insertCntHistory(CntHistoryVO cvo) {
		boardDAO.insertCntHistory(cvo);
		
	}
	
	@Override
	public void updateCnt(ReviewBoardVO vo) {
		boardDAO.updateCnt(vo);
		
	}
	
	@Override
	public int getTotalPages(ReviewBoardVO vo) {
		return boardDAO.getTotalPages(vo);
	}

	@Override
	public List<ReviewBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		return boardDAO.getBoardListWithPaging(cri);
	}

	@Override
	public List<ReviewBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return boardDAO.getBoardListWithDynamicPaging(cri);
	}

	@Override
	public List<ReviewBoardVO> getBoardListMain(ReviewBoardVO vo) {
		
		return boardDAO.getBoardListMain(vo);
	}

	@Override
	public List<ReviewBoardVO> getSearchReview(ReviewBoardVO vo) {
	
		return boardDAO.getSearchReview(vo);
	}

	@Override
	public int getSeq() {

		return boardDAO.getSeq();
	}

	@Override
	public CntHistoryVO getCntBoard(CntHistoryVO cvo) {

		return boardDAO.getCntBoard(cvo);
	}
	
	@Override
	public void reportUpdateReviewY(ReviewBoardVO vo) {

		boardDAO.reportUpdateReviewY(vo);
	}

	@Override
	public void reportUpdateReviewN(ReviewBoardVO vo) {

		boardDAO.reportUpdateReviewN(vo);
	}
	
	@Override
	public void updateReviewLike(ReviewBoardVO vo) {
		boardDAO.updateReviewLike(vo);
		
	}

	@Override
	public void updateReviewLikeCancel(ReviewBoardVO vo) {
		boardDAO.updateReviewLikeCancel(vo);
		
	}

	@Override
	public List<ReviewBoardVO> cgetBoardList(ReviewBoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.cgetBoardList(vo);
	}
}
