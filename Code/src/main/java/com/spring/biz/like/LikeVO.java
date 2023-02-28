package com.spring.biz.like;

public class LikeVO {
	private int contents_num; // 컨텐츠 ID
	private String contents_type; // 컨텐츠 타입
	private String userId; // 회원 아이디
	private int count; // 보고싶어요 갯수

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getContents_num() {
		return contents_num;
	}

	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
	}

	public String getContents_type() {
		return contents_type;
	}

	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "LikeVO [contents_num=" + contents_num + ", contents_type=" + contents_type + ", userId=" + userId
				+ ", count=" + count + "]";
	}
}
