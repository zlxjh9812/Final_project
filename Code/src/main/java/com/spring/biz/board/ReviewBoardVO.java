package com.spring.biz.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class ReviewBoardVO {

	private int bseq;
	private Integer boardnum=null;
	private String title;
	private String nickname;
	private String content;
	private String filename;
	private String writedate;
	private int like_num;
	private int unlike_num;
	private int cnt;
	private String userId;
	private String writdate;
	private MultipartFile uploadFile;
	private int moviecode;
	private int pageNum;
	private int amount;
	private String searchCondition;
	private String searchKeyword;
	private List<String> tags;
	private String contentType;	
	private String reviewPic;
	
	public ReviewBoardVO() {
		this.pageNum = 1;
		this.amount = 15;
		this.searchCondition = "TITLE";
		this.searchKeyword = "";
	}
	
	
	
	
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public Integer getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(Integer boardnum) {
		this.boardnum = boardnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getUnlike_num() {
		return unlike_num;
	}
	public void setUnlike_num(int unlike_num) {
		this.unlike_num = unlike_num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getWritdate() {
		return writdate;
	}
	public void setWritdate(String writdate) {
		this.writdate = writdate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getMoviecode() {
		return moviecode;
	}
	public void setMoviecode(int moviecode) {
		this.moviecode = moviecode;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getReviewPic() {
		return reviewPic;
	}
	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}
	
	public String makeQuery() {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("searchCondition", this.searchCondition)
				.queryParam("searchKeyword", this.searchKeyword)
				.build();
		
		return uriComponents.toUriString();
	}





	@Override
	public String toString() {
		return "ReviewBoardVO [bseq=" + bseq + ", boardnum=" + boardnum + ", title=" + title + ", nickname=" + nickname
				+ ", content=" + content + ", filename=" + filename + ", writedate=" + writedate + ", like_num="
				+ like_num + ", unlike_num=" + unlike_num + ", cnt=" + cnt + ", userId=" + userId + ", writdate="
				+ writdate + ", uploadFile=" + uploadFile + ", moviecode=" + moviecode + ", pageNum=" + pageNum
				+ ", amount=" + amount + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", tags=" + tags + ", contentType=" + contentType + ", reviewPic=" + reviewPic + "]";
	}
	
	
	
	
}
