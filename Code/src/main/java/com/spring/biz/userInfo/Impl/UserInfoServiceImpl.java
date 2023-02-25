package com.spring.biz.userInfo.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.userInfo.UserInfoService;
import com.spring.biz.userInfo.UserInfoVO;


@Service("UserInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public UserInfoVO getNickname(UserInfoVO vo) {
		return userInfoDAO.nickNameCheck(vo);
		
	}

	@Override
	public void insertUserInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		userInfoDAO.insertUserInfo(vo);
	}

	@Override
	public UserInfoVO getUserInfo(UserInfoVO vo) {
		
		return userInfoDAO.getUserInfo(vo);
	}

	@Override
	public void updateUserReportCount(UserInfoVO vo) {
		// TODO Auto-generated method stub
		userInfoDAO.updateUserReportCount(vo);
	}

	@Override
	public void updateUserReportY(UserInfoVO vo) {
		// TODO Auto-generated method stub
		userInfoDAO.updateUserReportY(vo);
	}

	@Override
	public void updateUserReportN(UserInfoVO vo) {
		// TODO Auto-generated method stub
		userInfoDAO.updateUserReportN(vo);
	}

	@Override
	public void userImgUpload(String userId, String userImg) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserInfoVO findMemberById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
