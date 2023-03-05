package com.spring.biz.support.qnaCmt;

public interface QnaCommentDAO {
	
	public QnaCommentVO getCommentByBoardId(int boardId);

	public QnaCommentVO getCommentByCommentId(int commentId);
	
	public void insertComment(QnaCommentVO qnaCommentVO);

	public void updateComment(QnaCommentVO qnaCommentVO);

	public void updateAnswerStatus(int boardId);
	
	public void deleteComment(int commentId);
	
	public void updateAnswerStatusToFalse(int boardId);

}
