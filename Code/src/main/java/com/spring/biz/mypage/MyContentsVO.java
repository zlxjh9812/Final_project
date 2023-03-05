package com.spring.biz.mypage;

public class MyContentsVO {

	private String contentsType; // 컨텐츠 타입
	private int contentsNum; // 컨텐츠 ID
	private String userId; // 유저 ID

	public String getContentsType() {
		return contentsType;
	}

	public void setContentsType(String contentsType) {
		this.contentsType = contentsType;
	}

	public int getContentsNum() {
		return contentsNum;
	}

	public void setContentsNum(int contentsNum) {
		this.contentsNum = contentsNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
