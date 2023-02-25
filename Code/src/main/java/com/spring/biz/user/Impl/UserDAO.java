package com.spring.biz.user.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO nickNameCheck(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.nickNameCheck", vo);
	}
	
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}
	
	public UserVO idCheck(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.idCheck",vo);
		
	}
	public UserVO telCheck(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.telCheck", vo);
	}
	
	public UserVO emailCheck(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.emailCheck",vo); 
	}
	
	public UserVO FindPassword(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.FindPassword",vo);
	}
	
	public void updatePassword(UserVO vo) {
		mybatis.update("UserDAO.updatePassword", vo);
	}
	
	public List<UserVO> getAllUser(UserVO vo){
		return mybatis.selectList("UserDAO.getAllUser",vo);
	}
	
	public void updateUserReportCount(UserVO vo) {
		mybatis.update("UserDAO.updateUserReportCount", vo);
	}
	
	public void updateUserReportY(UserVO vo) {
		mybatis.update("UserDAO.updateUserReportY", vo);
	}
	
	public void updateUserReportN(UserVO vo) {
		mybatis.update("UserDAO.updateUserReportN", vo);
	}
	
	public void userImgUpload(String userId, String userImg) {
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("userId", userId);
	    parameterMap.put("userImg", userImg);	    
		mybatis.update("UserDAO.userImgUpload", parameterMap);
	}
	
	public UserVO findMemberById(String userId) {
		return mybatis.selectOne("UserDAO.findMemberById", userId);
	}

	public void userEdit(UserVO vo) {
		mybatis.update("UserDAO.userEdit", vo);
	}
	
	public void withdraw(UserVO vo) {
		mybatis.update("UserDAO.withdraw", vo);
	}
}
