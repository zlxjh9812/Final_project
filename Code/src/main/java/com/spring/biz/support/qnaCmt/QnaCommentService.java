package com.spring.biz.support.qnaCmt;

public interface QnaCommentService {
	
	public QnaCommentVO getCommentByBoardId(int boardId);

	public QnaCommentVO getCommentByCommentId(int commentId);
	
	public void insertComment(QnaCommentVO qnaCommentVO);

	public void updateComment(QnaCommentVO qnaCommentVO);

	public void deleteComment(QnaCommentVO qnaCommentVO);

}
