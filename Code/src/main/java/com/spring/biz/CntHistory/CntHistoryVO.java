package com.spring.biz.CntHistory;

public class CntHistoryVO {

	private int bseq;
	private String UserId;
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	@Override
	public String toString() {
		return "CntHistoryVO [bseq=" + bseq + ", UserId=" + UserId + "]";
	}
	
	
}
