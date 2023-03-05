package com.spring.biz.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.mypage.CountInfoVO;
import com.spring.biz.mypage.MyContentsDAO;
import com.spring.biz.mypage.MyContentsService;
import com.spring.biz.mypage.MyContentsVO;
import com.spring.biz.mypage.MyStarVO;
import com.spring.biz.mypage.util.SearchCriteria;

@Service
public class MyContentsServiceImpl implements MyContentsService {
	
	private final MyContentsDAO myContentsDAO;
	
	@Autowired
	public MyContentsServiceImpl(MyContentsDAO myContentsDAO) {
		this.myContentsDAO = myContentsDAO;
	}
	
	// 나의 관심 컨텐츠 개수
	public int countAllMyLike(SearchCriteria criteria, String userId) {
		return myContentsDAO.countAllMyLike(criteria, userId);
	}
	
	// 내가 평가한 컨텐츠 개수
	public int countAllMyStar(SearchCriteria criteria, String userId) {
		return myContentsDAO.countAllMyStar(criteria, userId);
	}
	
	// 내가 작성한 리뷰 개수
	public int countAllMyReview(SearchCriteria criteria, String userId) {
		return myContentsDAO.countAllMyReview(criteria, userId);
	}

	// 나의 관심 컨텐츠 목록
	public List<MyContentsVO> getMyLikeContents(SearchCriteria criteria, String userId) {
		return myContentsDAO.getMyLikeContents(criteria, userId);
	}

	// 내가 평가한 컨텐츠 목록
	public List<MyStarVO> getMyStarContents(SearchCriteria criteria, String userId) {
		return myContentsDAO.getMyStarContents(criteria, userId);
	}
	
	// 내가 작성한 리뷰 목록
	public List<ReviewBoardVO> getMyReviewList(SearchCriteria criteria, String userId) {
		return myContentsDAO.getMyReviewList(criteria, userId);
	}
	
	// 각각의 개수 저장
	public CountInfoVO getCountInfo(SearchCriteria criteria, String userId) {
	    CountInfoVO countInfo = new CountInfoVO();
	    countInfo.setCountAllMyLike(countAllMyLike(criteria, userId));
	    countInfo.setCountAllMyStar(countAllMyStar(criteria, userId));
	    countInfo.setCountAllMyReview(countAllMyReview(criteria, userId));
	    return countInfo;
	}

}
