package com.spring.biz.reportComment.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.reportComment.ReportCommentVO;
import com.spring.biz.util.SearchCriteria;

@Repository
public class ReportCommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void inserReportComment(ReportCommentVO vo) {
		mybatis.insert("reportCommentDAO.insertReport", vo);
	}
	public List<ReportCommentVO> getBoardListPaging(SearchCriteria cri){
		return mybatis.selectList("reportCommentDAO.getBoardListWithDynamicPaging",cri);
	}
	public int getTotalComment(SearchCriteria cri) {
		return mybatis.selectOne("reportCommentDAO.getTotalPages",cri);
	}
	public List<ReportCommentVO> getReportCommentDetai(ReportCommentVO vo){
		return mybatis.selectList("reportCommentDAO.getReportCommentDetail",vo);
	}
	public int getValid(ReportCommentVO vo) {
		return mybatis.selectOne("reportCommentDAO.getInvalid",vo);
	}
	public void updateRepoerComment(ReportCommentVO vo) {
		mybatis.update("reportCommentDAO.updateReortComment",vo);
	}
	public void deleteReportComment(ReportCommentVO vo) {
		mybatis.delete("reportCommentDAO.deleteReportComment",vo);
	}
}
