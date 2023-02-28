package com.spring.biz.support.util;

public class PageMaker {

	private int totalCount; // 전체 게시글 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // 이전 페이지 링크 여부
	private boolean next; // 다음 페이지 링크 여부
	private SearchCriteria criteria; // 현재 페이지 정보

	public PageMaker() {
		// TODO Auto-generated constructor stub
	}

	public PageMaker(SearchCriteria criteria, int totalCount) {
		this.criteria = criteria;
		this.totalCount = totalCount;
		int realEnd = (int) (Math.ceil((totalCount * 1.0) / criteria.getPerPageNum()));
		this.startPage = (int) (Math.floor((criteria.getPage() - 1) / 5.0) * 5 + 1);
		this.endPage = Math.min(this.startPage + 4, realEnd);
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public SearchCriteria getCriteria() {
		return criteria;
	}

	public void setCriteria(SearchCriteria criteria) {
		this.criteria = criteria;
	}

}
