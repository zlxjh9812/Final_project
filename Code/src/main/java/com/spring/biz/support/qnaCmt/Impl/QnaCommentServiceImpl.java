package com.spring.biz.support.qnaCmt.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.support.qnaCmt.QnaCommentDAO;
import com.spring.biz.support.qnaCmt.QnaCommentService;
import com.spring.biz.support.qnaCmt.QnaCommentVO;

@Service
public class QnaCommentServiceImpl implements QnaCommentService{

	private final QnaCommentDAO qnaCommentDAO;
	
	@Autowired
	public QnaCommentServiceImpl(QnaCommentDAO qnaCommentDAO) {
		this.qnaCommentDAO = qnaCommentDAO;
	}
	
	@Override
	public QnaCommentVO getCommentByBoardId(int boardId) {
		return qnaCommentDAO.getCommentByBoardId(boardId);
	}
	
	@Override
	public QnaCommentVO getCommentByCommentId(int commentId) {
		return qnaCommentDAO.getCommentByCommentId(commentId);
	}

	@Override
	public void insertComment(QnaCommentVO qnaCommentVO) {
		qnaCommentDAO.insertComment(qnaCommentVO);
		qnaCommentDAO.updateAnswerStatus(qnaCommentVO.getBoardId());
	}

	@Override
	public void updateComment(QnaCommentVO qnaCommentVO) {
		qnaCommentDAO.updateComment(qnaCommentVO);
	}

	@Override
	public void deleteComment(QnaCommentVO qnaCommentVO) {
		qnaCommentDAO.deleteComment(qnaCommentVO.getCommentId());
		qnaCommentDAO.updateAnswerStatusToFalse(qnaCommentVO.getBoardId());
	}
	
}
