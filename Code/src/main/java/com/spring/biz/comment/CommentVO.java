package com.spring.biz.comment;

import com.spring.biz.util.DurationFromNow;

public class CommentVO {
	private int comment_num; // 코멘트번호
	private String contents_type; // 컨텐츠 타입
	private int contents_num; // 컨텐츠 넘버
	private String content; // 코멘트 내용
	private String reg_date; // 등록날짜
	private String modify_date; // 수정날짜
	private String userId; // 회원 아이디
	private int star_num; // dcontents_star 테이블과 연결할 용도의 star_num
	private int count; // 코멘트 갯수
	private double star; // 코멘트랑 세트로 쓰일 별점이 저장될 용도
	private int countLike; // 코멘트에 눌린 좋아요 갯수
	private int checkCmtLike; // 코멘트 좋아요 여부 확인
	private String MovieTitle;
	

	public String getMovieTitle() {
		return MovieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		MovieTitle = movieTitle;
	}

	public CommentVO() {
		super();
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getContents_type() {
		return contents_type;
	}

	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}

	public int getContents_num() {
		return contents_num;
	}

	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = DurationFromNow.getTimeDiffLabel(reg_date);
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = DurationFromNow.getTimeDiffLabel(modify_date);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getStar_num() {
		return star_num;
	}

	public void setStar_num(int star_num) {
		this.star_num = star_num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public int getCheckCmtLike() {
		return checkCmtLike;
	}

	public void setCheckCmtLike(int checkCmtLike) {
		this.checkCmtLike = checkCmtLike;
	}

	@Override
	public String toString() {
		return "CommentVO [comment_num=" + comment_num + ", contents_type=" + contents_type + ", contents_num="
				+ contents_num + ", content=" + content + ", reg_date=" + reg_date + ", modify_date=" + modify_date
				+ ", userId=" + userId + ", star_num=" + star_num + ", count=" + count + ", star=" + star
				+ ", countLike=" + countLike + ",  checkCmtLike=" + checkCmtLike + "]";
	}

}
