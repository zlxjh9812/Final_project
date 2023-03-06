package com.spring.biz.support.faq.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.support.faq.FaqBoardDAO;
import com.spring.biz.support.faq.FaqBoardVO;
import com.spring.biz.support.util.SearchCriteria;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "com.spring.biz.support.faq.FaqBoardDAO";

	@Autowired
	public FaqBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int getBoardCount(SearchCriteria criteria) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".getBoardCount", paramMap);
	}

	@Override
	public FaqBoardVO getBoardById(int boardId) {
		return sqlSession.selectOne(NAMESPACE + ".getBoardById", boardId);
	}

	@Override
	public List<FaqBoardVO> getBoardList(SearchCriteria criteria) {
		if (criteria.getSearchType() == null) {
			criteria.setSearchType("");
		}

		if (criteria.getKeyword() == null) {
			criteria.setKeyword("");
		}

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("criteria", criteria);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectList(NAMESPACE + ".getBoardList", criteria);
	}

	@Override
	public void insertBoard(FaqBoardVO faqBoardVO) {
		sqlSession.insert(NAMESPACE + ".insertBoard", faqBoardVO);

	}

	@Override
	public void updateBoard(FaqBoardVO faqBoardVO) {
		sqlSession.update(NAMESPACE + ".updateBoard", faqBoardVO);

	}

	@Override
	public void deleteBoard(int boardId) {
		sqlSession.delete(NAMESPACE + ".deleteBoard", boardId);

	}

}
