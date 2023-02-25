package com.spring.biz.UserBlackList.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.UserBlackList.UserBlackListVO;
import com.spring.biz.util.SearchCriteria;

@Repository
public class UserBlackListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReportUser(UserBlackListVO vo) {
		mybatis.insert("BlackListDAO.insertReportUserBySysdate",vo);
	}
	
	public List<UserBlackListVO> getReportUser(SearchCriteria cri){
		return mybatis.selectList("BlackListDAO.getEndDateUser",cri);
	}
	public void updateReportUser(UserBlackListVO vo) {
		mybatis.update("BlackListDAO.updateByEndDate", vo);
	}
	public UserBlackListVO getUser(UserBlackListVO vo) {
		return mybatis.selectOne("BlackListDAO.getUser", vo);
	}
	public List<UserBlackListVO> getAllUser(SearchCriteria cri){
		return mybatis.selectList("BlackListDAO.getBlackListUser",cri);
	}
	public int getEndDateUserCount(SearchCriteria cri) {
		return mybatis.selectOne("BlackListDAO.getEndDateUserCount", cri);
	}
	public int getAllBlackCoutn(SearchCriteria cri) {
		return mybatis.selectOne("BlackListDAO.getAllBlackCount",cri);
	}
	public void DeleteReportUser(UserBlackListVO vo) {
		mybatis.delete("BlackListDAO.DeleteReportUser",vo);
	}
}
