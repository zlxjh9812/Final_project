package com.spring.biz.reportComment;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface ReportCommentService {

	public void insertReportComment(ReportCommentVO vo);							//신고하기
	public List<ReportCommentVO> getBoardListWithDynamicPaging(SearchCriteria cri);//페이징
	public int getTotalPages(SearchCriteria cri);									//페이징
	public List<ReportCommentVO> getReportCommentDetail(ReportCommentVO vo);		//상세정보
	public int getValid(ReportCommentVO vo);										//신고 중복체크
	public void updateReportComment(ReportCommentVO vo);
	public void deleteReportComment(ReportCommentVO vo);
}
