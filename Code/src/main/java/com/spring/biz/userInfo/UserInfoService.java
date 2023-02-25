package com.spring.biz.userInfo;



public interface UserInfoService {
	//닉네임 중복 확인
	UserInfoVO getNickname(UserInfoVO vo);
	//회원가입
	public void insertUserInfo(UserInfoVO vo);
	//유저 정보 가져오기
	UserInfoVO getUserInfo(UserInfoVO vo);
	//유저 제재 횟수
	void updateUserReportCount(UserInfoVO vo);
	//유저 제재 하기
	void updateUserReportY(UserInfoVO vo);
	//유저 제재 
	void updateUserReportN(UserInfoVO vo);
	//유저 사진 업로드
	public void userImgUpload(String userId, String userImg);
	public UserInfoVO findMemberById(String userId);
}
