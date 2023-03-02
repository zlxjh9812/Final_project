package com.spring.biz.user.Impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
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
	public void userEdit(UserVO userVO) {
		// 비밀번호를 변경하지 않을 경우 현재 비밀번호 유지
		if (userVO.getPassword() == null || userVO.getPassword() == "") {
			UserVO userInfo = userDAO.findUserById(userVO.getUserId());
			userVO.setPassword(userInfo.getPassword());
		} else {
			String encodedPw = pwdEncoder.encode(userVO.getPassword());
			userVO.setPassword(encodedPw);
		}
		userDAO.userEdit(userVO);
	}

	@Override
	public void uploadProfileImage(MultipartFile file, UserVO user) throws Exception {
		final String PROFILE_IMAGE_PATH = "/resources/UserProfile/";
		String originalFilename = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString() + "_" + originalFilename;

		File dir = new File(PROFILE_IMAGE_PATH);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		String uploadPath = PROFILE_IMAGE_PATH + uploadFileName;

		File dest = new File(session.getServletContext().getRealPath(PROFILE_IMAGE_PATH + uploadFileName));
		file.transferTo(dest);

		user.setProfileImg(uploadPath);
		userDAO.userImgUpload(user.getUserId(), user.getProfileImg());
	}

	@Override
	public void withdraw(UserVO vo) {
		userDAO.withdraw(vo);
	}

	@Override
	public UserVO findMemberById(String userId) {
		return userDAO.findMemberById(userId);
	}
	
	@Override
	public UserVO findUserById(String userId) {
		return userDAO.findUserById(userId);
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
	
	@Override
	public boolean isNameDuplicate(String userName) {
		return userDAO.checkNameDuplicate(userName) == 0;
	}

}
