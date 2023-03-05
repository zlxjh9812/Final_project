package com.spring.biz.support.qnaCmt.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.biz.support.qnaCmt.QnaCommentDAO;
import com.spring.biz.support.qnaCmt.QnaCommentVO;

@Repository
public class QnaCommentDAOImpl implements QnaCommentDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "com.spring.biz.support.qna.cmt.QnaCommentDAO";
	
	public QnaCommentDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public QnaCommentVO getCommentByBoardId(int boardId) {
		return sqlSession.selectOne(NAMESPACE + ".getCommentByBoardId", boardId);
	}
	
	@Override
	public QnaCommentVO getCommentByCommentId(int commentId) {
		return sqlSession.selectOne(NAMESPACE + ".getCommentByCommentId", commentId);
	}

	@Override
	public void insertComment(QnaCommentVO qnaCommentVO) {
		sqlSession.insert(NAMESPACE + ".insertComment", qnaCommentVO);

	}

	@Override
	public void updateComment(QnaCommentVO qnaCommentVO) {
		System.out.println("댓글 덥데이트 DAO");
		sqlSession.update(NAMESPACE + ".updateComment", qnaCommentVO);

	}

	@Override
	public void updateAnswerStatus(int boardId) {
		sqlSession.update(NAMESPACE + ".updateAnswerStatus", boardId);
	}

	@Override
	public void deleteComment(int commentId) {
		sqlSession.update(NAMESPACE + ".deleteComment", commentId);
	}
	
	@Override
	public void updateAnswerStatusToFalse(int boardId) {
		sqlSession.update(NAMESPACE + ".updateAnswerStatusToFalse", boardId);
		
	}
	
}
