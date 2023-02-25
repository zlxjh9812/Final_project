package com.spring.biz.user.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	@Override
	public UserVO idCheck(UserVO vo) {
		return userDAO.idCheck(vo);
	}

	@Override
	public UserVO telCheck(UserVO vo) {
		return userDAO.telCheck(vo);
	}

	@Override
	public UserVO emailCheck(UserVO vo) {	
		return userDAO.emailCheck(vo);
	}

	@Override
	public UserVO FindPassword(UserVO vo) {
		return userDAO.FindPassword(vo);
	}

	@Override
	public void updatePassword(UserVO vo) {
		userDAO.updatePassword(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getAllUser(vo);
	}

	@Override
	public void userImgUpload(String userId, String userImg) {
		userDAO.userImgUpload(userId, userImg);
	}

	@Override
	public void withdraw(UserVO vo) {
		userDAO.withdraw(vo);
	}

	@Override
	public void userEdit(UserVO vo) {
		userDAO.userEdit(vo);
	}

	@Override
	public UserVO findMemberById(String userId) {
		return userDAO.findMemberById(userId);
	}

	@Override
	public UserVO getNickname(UserVO vo) {
		return userDAO.nickNameCheck(vo);
	}

	@Override
	public void updateUserReportCount(UserVO vo) {
		userDAO.updateUserReportCount(vo);
	}

	@Override
	public void updateUserReportY(UserVO vo) {
		userDAO.updateUserReportY(vo);

	}

	@Override
	public void updateUserReportN(UserVO vo) {
		userDAO.updateUserReportN(vo);

	}

}
