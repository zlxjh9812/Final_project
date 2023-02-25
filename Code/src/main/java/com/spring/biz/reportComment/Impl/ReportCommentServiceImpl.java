package com.spring.biz.reportComment.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.reportComment.ReportCommentService;
import com.spring.biz.reportComment.ReportCommentVO;
import com.spring.biz.util.SearchCriteria;

@Service("reportCommentService")
public class ReportCommentServiceImpl implements ReportCommentService {

	@Autowired
	private ReportCommentDAO reportCommentDAO;
	
	
	@Override
	public void insertReportComment(ReportCommentVO vo) {
		reportCommentDAO.inserReportComment(vo);

	}

	@Override
	public List<ReportCommentVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return reportCommentDAO.getBoardListPaging(cri);
	}

	@Override
	public int getTotalPages(SearchCriteria cri) {
		return reportCommentDAO.getTotalComment(cri);
	}

	@Override
	public List<ReportCommentVO> getReportCommentDetail(ReportCommentVO vo) {
		return reportCommentDAO.getReportCommentDetai(vo);
	}

	@Override
	public int getValid(ReportCommentVO vo) {
		return reportCommentDAO.getValid(vo);
	}

	@Override
	public void updateReportComment(ReportCommentVO vo) {
		reportCommentDAO.updateRepoerComment(vo);
	}

	@Override
	public void deleteReportComment(ReportCommentVO vo) {
		reportCommentDAO.deleteReportComment(vo);
	}

}
