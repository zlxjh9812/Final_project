package com.spring.biz.mypage;

import java.util.List;

import com.spring.biz.board.ReviewBoardVO;
import com.spring.biz.mypage.util.SearchCriteria;

public interface MyContentsService {
	
	// 나의 관심 컨텐츠 개수
	public int countAllMyLike(SearchCriteria criteria, String userId);

	// 내가 평가한 컨텐츠 개수
	public int countAllMyStar(SearchCriteria criteria, String userId);

	// 내가 작성한 리뷰 개수
	public int countAllMyReview(SearchCriteria criteria, String userId);
	
	// 나의 관심 컨텐츠 목록
	public List<MyContentsVO> getMyLikeContents(SearchCriteria criteria, String userId);
	
	// 내가 평가한 컨텐츠 목록
	public List<MyStarVO> getMyStarContents(SearchCriteria criteria, String userId);
	
	// 내가 작성한 리뷰 목록
	public List<ReviewBoardVO> getMyReviewList(SearchCriteria criteria, String userId);
	
	// 각각의 개수 저장
	public CountInfoVO getCountInfo(SearchCriteria criteria, String userId);
	
}
