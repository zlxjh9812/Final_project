package com.spring.biz.support.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.support.qna.QnaBoardDAO;
import com.spring.biz.support.qna.QnaBoardService;
import com.spring.biz.support.qna.QnaBoardVO;
import com.spring.biz.support.util.SearchCriteria;

@Service
public class QnaBoardServiceeImpl implements QnaBoardService {

	private final QnaBoardDAO qnaBoardDAO;
	
	@Autowired
	public QnaBoardServiceeImpl(QnaBoardDAO qnaBoardDAO) {
		this.qnaBoardDAO = qnaBoardDAO;
	}
	
	@Override
	public int getBoardCount() {
		return qnaBoardDAO.getBoardCount();
	}
	
	@Override
	public List<QnaBoardVO> getBoardList(SearchCriteria criteria) {
		return qnaBoardDAO.getBoardList(criteria);
	}
	
	@Override
	public int getMyBoardCount(SearchCriteria criteria, String userId) {
		return qnaBoardDAO.getMyBoardCount(criteria, userId);
	}
	
	@Override
	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId) {
		return qnaBoardDAO.getMyBoardList(criteria, userId);
	}
	
	@Override
	public QnaBoardVO getBoard(int boardId) {
		return qnaBoardDAO.getBoard(boardId);
	}
	
	@Override
	public QnaBoardVO insertBoard(QnaBoardVO qnaBoardVO) {
		qnaBoardDAO.insertBoard(qnaBoardVO);
		return qnaBoardVO;
	}
	
}
