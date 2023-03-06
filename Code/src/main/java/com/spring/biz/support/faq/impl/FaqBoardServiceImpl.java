package com.spring.biz.support.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.support.faq.FaqBoardDAO;
import com.spring.biz.support.faq.FaqBoardService;
import com.spring.biz.support.faq.FaqBoardVO;
import com.spring.biz.support.util.SearchCriteria;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {

	private final FaqBoardDAO faqBoardDAO;
	
	@Autowired
	public FaqBoardServiceImpl(FaqBoardDAO faqBoardDAO) {
		this.faqBoardDAO = faqBoardDAO;
	}
	
	@Override
	public int getBoardCount(SearchCriteria criteria) {
		return faqBoardDAO.getBoardCount(criteria);
	}
	
	@Override
	public FaqBoardVO getBoardById(int boardId) {
		return faqBoardDAO.getBoardById(boardId);
	}
	
	@Override
	public List<FaqBoardVO> getBoardList(SearchCriteria criteria) {
		return faqBoardDAO.getBoardList(criteria);
	}
	
	@Override
	public void insertBoard(FaqBoardVO faqBoardVO) {
		faqBoardDAO.insertBoard(faqBoardVO);
		
	}
	
	@Override
	public void updateBoard(FaqBoardVO faqBoardVO) {
		faqBoardDAO.updateBoard(faqBoardVO);
		
	}
	
	@Override
	public void deleteBoard(int boardId) {
		faqBoardDAO.deleteBoard(boardId);
		
	}
	
}
