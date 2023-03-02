package com.spring.biz.user;

public class UserVO {
	private String UserId;
	private String password;
	private String tel;
	private String email;
	private String name;
	private String role;
	private String nickName;
	private String profileImg;
	private int reportCount;
	private String report;

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		this.UserId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}



	public String getNickname() {
		return nickName;
	}

	public void setNickname(String nickname) {
		this.nickName = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
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
		return "UserVO [UserId=" + UserId + ", password=" + password + ", tel=" + tel + ", email=" + email + ", name="
				+ name + ", role=" + role +   ", nickName=" + nickName
				+ ", profileImg=" + profileImg + ", reportCount=" + reportCount + ", report=" + report + "]";
	}

}
