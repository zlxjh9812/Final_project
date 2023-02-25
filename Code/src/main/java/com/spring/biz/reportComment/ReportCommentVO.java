package com.spring.biz.reportComment;

public class ReportCommentVO {
	private int reportSeq;
	private String targetID;
	private int tableNum;
	private String reportOption;
	private String reportDetail;
	private int seq;
	private String UserId;
	private String value;
	private int RN;
	public int getReportSeq() {
		return reportSeq;
	}
	public void setReportSeq(int reportSeq) {
		this.reportSeq = reportSeq;
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getRN() {
		return RN;
	}
	public void setRN(int rN) {
		RN = rN;
	}
	@Override
	public String toString() {
		return "ReportCommentVO [reportSeq=" + reportSeq + ", targetID=" + targetID + ", tableNum=" + tableNum
				+ ", reportOption=" + reportOption + ", reportDetail=" + reportDetail + ", seq=" + seq + ", UserId="
				+ UserId + ", value=" + value + ", RN=" + RN + "]";
	}
	
	
}
