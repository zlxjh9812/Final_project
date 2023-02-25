package com.spring.biz.reportReview.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.spring.biz.reportReview.ReportReviewVO;
import com.spring.biz.util.SearchCriteria;


@Repository
public class ReportReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReportReview(ReportReviewVO vo) {
		mybatis.insert("ReportReviewDAO.insertReport",vo);
	}
	
	public List<ReportReviewVO> getReportReviewList(ReportReviewVO vo){
		return mybatis.selectList("ReportReviewDAO.getReportList", vo);
	}
	
	public int getTotalPages(SearchCriteria cri) {
		return mybatis.selectOne("ReportReviewDAO.getTotalPages", cri);
	}

	// 글 목록 조회 with paging
	public List<ReportReviewVO> getBoardListWithPaging(SearchCriteria cri) {
		return mybatis.selectList("ReportReviewDAO.getBoardListWithPaging", cri);
	}
	
	// 글 목록 조회 with paging
	public List<ReportReviewVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return mybatis.selectList("ReportReviewDAO.getBoardListWithDynamicPaging", cri);
	}
	
	public List<ReportReviewVO> getReportReviewDetail(ReportReviewVO vo){
		return mybatis.selectList("ReportReviewDAO.getReportDetail",vo);
	}
	
	public int getValid(ReportReviewVO vo) {
		return mybatis.selectOne("ReportReviewDAO.getInvalid",vo);
	}
	public void updateReportReview(ReportReviewVO vo) {
		mybatis.update("ReportReviewDAO.updateReortReview", vo);
	}
	
	public void deleteReportReview(ReportReviewVO vo) {
		mybatis.delete("ReportReviewDAO.deleteReportReview",vo);
	}
}
