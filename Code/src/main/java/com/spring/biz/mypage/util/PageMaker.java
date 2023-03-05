package com.spring.biz.mypage.util;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private SearchCriteria criteria;

	public PageMaker() {

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
