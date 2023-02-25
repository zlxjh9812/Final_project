package com.spring.biz.reportReview;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface ReportReviewService {
	
	//리뷰 게시물 신고하기
	public void insertReportReview(ReportReviewVO vo);
	
	public List<ReportReviewVO> getReportList(ReportReviewVO vo);
	
	// 글 목록 조회 with paging
	public List<ReportReviewVO> getBoardListWithPaging(SearchCriteria cri);

	// 글 목록 조회 with dynamic(search condition) paging
	public List<ReportReviewVO> getBoardListWithDynamicPaging(SearchCriteria cri);
	
	public int getTotalPages(SearchCriteria cri);
	
	public List<ReportReviewVO> getReportReviewDetail(ReportReviewVO vo);
	
	//신고 중복체크
	public int getValid(ReportReviewVO vo);					
	
	public void updateReportReview(ReportReviewVO vo);
	
	public void deleteReportReview(ReportReviewVO vo);
}
