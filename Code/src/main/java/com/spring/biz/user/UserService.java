package com.spring.biz.user;

import java.util.List;


public interface UserService {

	// 로그인
	public UserVO getUser(UserVO vo);
	
	// 회원가입
	public void insertUser(UserVO vo);
	
	// 아이디 중복 체크
	public UserVO idCheck(UserVO vo);
	
	// 전화번호 체크
	public UserVO telCheck(UserVO vo);
	
	// 이메일 체크
	public UserVO emailCheck(UserVO vo);
	
	// 비밀번호 찾기
	public UserVO FindPassword(UserVO vo);
	
	// 비밀번호 수정
	public void updatePassword(UserVO vo);
	
	// 유저 정보 리스트 가져오기
	public List<UserVO> getUserList(UserVO vo);
	
	// 프로필 이미지 등록
	public void userImgUpload(String userId, String userImg);
	
	// 유저 탈퇴
	public void withdraw(UserVO vo);
	
	// 유저 수정
	public void userEdit(UserVO vo);
	
	// 유저 정보 가져오기
	public UserVO findMemberById(String userId);
	
	// 닉네임 정보 가져오기
	public UserVO getNickname(UserVO vo);
	
	// 신고 횟수
	public void updateUserReportCount(UserVO vo);
	
	// 신고당한 사람 
	public void updateUserReportY(UserVO vo);
	
	//신고 취소
	public void updateUserReportN(UserVO vo);
}
