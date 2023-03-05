package com.spring.biz.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.mypage.MyContentsDAO;
import com.spring.biz.mypage.MyContentsVO;
import com.spring.biz.mypage.MyStarVO;
import com.spring.biz.mypage.util.SearchCriteria;

@Repository
public class MyContentsDAOImpl implements MyContentsDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "com.spring.biz.mypage.MyContentsDAO";
	private static final Map<String, String> CONTENT_TYPE_MAP = new HashMap<>();

	// 검색 조건
	static {
		CONTENT_TYPE_MAP.put("movie", "영화");
		CONTENT_TYPE_MAP.put("drama", "드라마");
	}

	@Autowired
	public MyContentsDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 나의 관심 컨텐츠 개수
	public int countAllMyLike(SearchCriteria criteria, String userId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".countAllMyLike", paramMap);
	}

	// 내가 평가한 컨텐츠 개수
	public int countAllMyStar(SearchCriteria criteria, String userId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".countAllMyStar", paramMap);
	}

	// 내가 작성한 리뷰 총 개수
	public int countAllMyReview(SearchCriteria criteria, String userId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".countAllMyReview", paramMap);
	}

	// 나의 관심 컨텐츠 목록
	public List<MyContentsVO> getMyLikeContents(SearchCriteria criteria, String userId) {

		// 검색 조건, 검색어가 없으면 전체 검색('')
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

		return sqlSession.selectList(NAMESPACE + ".getMyLikeContents", paramMap);
	}

	// 내가 평가한 컨텐츠 목록
	public List<MyStarVO> getMyStarContents(SearchCriteria criteria, String userId) {

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

		return sqlSession.selectList(NAMESPACE + ".getMyStarContents", paramMap);
	}

	// 내가 작성한 리뷰 목록
	public List<ReviewBoardVO> getMyReviewList(SearchCriteria criteria, String userId) {

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

		return sqlSession.selectList(NAMESPACE + ".getMyReviewList", paramMap);
	}

}
