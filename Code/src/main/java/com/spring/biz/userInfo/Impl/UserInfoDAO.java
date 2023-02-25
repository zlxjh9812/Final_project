package com.spring.biz.userInfo.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.userInfo.UserInfoVO;
@Repository
public class UserInfoDAO {
	@Autowired
	private SqlSessionTemplate myBatis;
	
	public UserInfoVO nickNameCheck(UserInfoVO vo) {
		return (UserInfoVO) myBatis.selectOne("UserInfoDAO.nickNameCheck", vo);
	}
	public void insertUserInfo(UserInfoVO vo) {
		myBatis.insert("UserInfoDAO.insertUserInfo", vo);
	}
	public UserInfoVO getUserInfo(UserInfoVO vo) {
		return (UserInfoVO) myBatis.selectOne("UserInfoDAO.getUserInfo", vo);
	}
	public void updateUserReportCount(UserInfoVO vo) {
		myBatis.update("UserInfoDAO.updateUserReportCount",vo);
	}
	public void updateUserReportY(UserInfoVO vo) {
		myBatis.update("UserInfoDAO.updateUserReportY",vo);
	}
	public void updateUserReportN(UserInfoVO vo) {
		myBatis.update("UserInfoDAO.updateUserReportN",vo);
	}
}
