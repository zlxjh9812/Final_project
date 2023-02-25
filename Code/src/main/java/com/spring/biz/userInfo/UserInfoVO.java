package com.spring.biz.userInfo;


public class UserInfoVO {
	private String nickname;
	private String profileImg;
	private String profile;
	private int reportCount;
	private String report;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	@Override
	public String toString() {
		return "UserInfoVO [nickname=" + nickname + ", profileImg=" + profileImg + ", profile=" + profile
				+ ", reportCount=" + reportCount + ", report=" + report + "]";
	}
	
}
