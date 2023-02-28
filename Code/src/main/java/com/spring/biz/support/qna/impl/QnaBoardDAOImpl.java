package com.spring.biz.support.qna.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.biz.support.qna.FileUploadVO;
import com.spring.biz.support.qna.QnaBoardDAO;
import com.spring.biz.support.qna.QnaBoardVO;
import com.spring.biz.support.util.SearchCriteria;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "com.spring.biz.support.qna.QnaBoardVO";

	public QnaBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(NAMESPACE + ".getBoardCount");
	}

	@Override
	public int getMyBoardCount(SearchCriteria criteria, String userId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".getMyBoardCount", paramMap);
	}

	@Override
	public List<QnaBoardVO> getBoardList(SearchCriteria criteria) {
		return sqlSession.selectList(NAMESPACE + ".getBoardList", criteria);
	}

	@Override
	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId) {
		if (criteria.getSearchType() == null) {
			criteria.setSearchType("");
		}

		if (criteria.getKeyword() == null) {
			criteria.setKeyword("");
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("criteria", criteria);
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());

		return sqlSession.selectList(NAMESPACE + ".getMyBoardList", paramMap);
	}

	@Override
	public QnaBoardVO getBoard(int boardId) {
		return sqlSession.selectOne(NAMESPACE + ".getBoard", boardId);
	}

	@Override
	public QnaBoardVO insertBoard(QnaBoardVO qnaBoardVO) {
		sqlSession.insert(NAMESPACE + ".insertBoard", qnaBoardVO);
		return qnaBoardVO;
	}

	@Override
	public void insertFileUpload(FileUploadVO fileUploadVO) {
		sqlSession.insert(NAMESPACE + ".insertFileUpload", fileUploadVO);
	}

}
