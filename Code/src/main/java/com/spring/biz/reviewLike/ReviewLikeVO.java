package com.spring.biz.reviewLike;

public class ReviewLikeVO {

	private int seq;
	private String userid;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "reviewLikeVO [seq=" + seq + ", userid=" + userid + "]";
	}
	
	
}
