package com.spring.biz.UserBlackList.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.spring.biz.UserBlackList.UserBlackListService;
import com.spring.biz.UserBlackList.UserBlackListVO;
import com.spring.biz.util.SearchCriteria;
@Service("UserBlackListService")
public class UserBlackListServiceImpl implements UserBlackListService{
	@Autowired
	private UserBlackListDAO userBlackListDAO; 
	@Override
	public void insertReportUser(UserBlackListVO vo) {
		// TODO Auto-generated method stub
		userBlackListDAO.insertReportUser(vo);
	}

	@Override
	public List<UserBlackListVO> getReportUser(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return userBlackListDAO.getReportUser(cri);
	}

	@Override
	public void updateReportUser(UserBlackListVO vo) {
		// TODO Auto-generated method stub
		userBlackListDAO.updateReportUser(vo);
	}

	@Override
	public UserBlackListVO getUser(UserBlackListVO vo) {
		// TODO Auto-generated method stub
		return userBlackListDAO.getUser(vo);
	}

	@Override
	public List<UserBlackListVO> getAllUser(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return userBlackListDAO.getAllUser(cri);
	}

	@Override
	public int getAllBlackListCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return userBlackListDAO.getAllBlackCoutn(cri);
	}

	@Override
	public int getEndDateUserCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return userBlackListDAO.getEndDateUserCount(cri);
	}

	@Override
	public void DeleteReportUser(UserBlackListVO vo) {
		// TODO Auto-generated method stub
		userBlackListDAO.DeleteReportUser(vo);
	}

}
