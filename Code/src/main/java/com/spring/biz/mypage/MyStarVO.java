package com.spring.biz.mypage;

public class MyStarVO {
	
	private int star_num; // 별점 ID
	private int contents_num; // 컨텐츠 ID
	private String userId; // 유저 ID
	private Double star; // 별점(0.5 ~ 5)
	private String contents_type; // 컨텐츠 타입

	public int getStar_num() {
		return star_num;
	}

	public void setStar_num(int star_num) {
		this.star_num = star_num;
	}

	public int getContents_num() {
		return contents_num;
	}

	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Double getStar() {
		return star;
	}

	public void setStar(Double star) {
		this.star = star;
	}

	public String getContents_type() {
		return contents_type;
	}

	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}

}
