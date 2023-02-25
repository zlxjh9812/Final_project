package com.spring.biz.reportReview;

public class ReportReviewVO {
	private int reportSeq;	//신고 seq
	private int seq;		//신고된 글 seq
	private String UserId;	//신고한 id
	private String targetID;//신고 당한 id
	private int tableNum;	//테이블 분류번호 (영화,웹툰 ,콘텐츠)
	private String reportOption;//신고사항 대분류
	private String reportDetail;//신고 상세사항
	private String value;
	private int RN;
	public int getRN() {
		return RN;
	}
	public void setRN(int rN) {
		RN = rN;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReportSeq() {
		return reportSeq;
	}
	public void setReportSeq(int reportSeq) {
		this.reportSeq = reportSeq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int cseq) {
		this.seq = cseq;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getTargetID() {
		return targetID;
	}
	public void setTargetID(String targetID) {
		this.targetID = targetID;
	}
	public int getTableNum() {
		return tableNum;
	}
	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
	}
	public String getReportOption() {
		return reportOption;
	}
	public void setReportOption(String reportOption) {
		this.reportOption = reportOption;
	}
	public String getReportDetail() {
		return reportDetail;
	}
	public void setReportDetail(String reportDetail) {
		this.reportDetail = reportDetail;
	}
}
