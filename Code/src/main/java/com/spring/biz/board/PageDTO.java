package com.spring.biz.board;

public class PageDTO {
	  private int startPage;
	  private int endPage;
	  private boolean prev, next;
	  private int totalPage;
	  private ReviewBoardVO vo;
	  private int displayPageItems = 10;

	  public PageDTO(ReviewBoardVO vo, int totalPage) {

	    this.vo = vo;
	    if (totalPage == 0) {
	    	this.totalPage = 1;
	    } else {
		    this.totalPage = totalPage;
	    }
	 
	    this.endPage = (int) (Math.ceil(vo.getPageNum() / (double) displayPageItems)) * displayPageItems;
	    this.startPage = (this.endPage - displayPageItems) + 1;
	    int realEnd = (int) (Math.ceil(totalPage / (double) vo.getAmount()));
	    if (realEnd <= this.endPage) {
	      this.endPage = realEnd;
	    }

	    this.prev = this.startPage > 1;
	    this.next = this.endPage < realEnd;
	    
	    // pageNumber가 endPage이면서, endPage에 게시글이 한개만 있는 경우, 해당 게시글을 삭제하면
	    // endPage가 1이 감소하여, 현재 pageNumber도 endPage로 수정  
	    if (this.vo.getPageNum() > this.endPage) {
	    	this.vo.setPageNum(endPage);
	    }
	  }

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotalPage() {
		return totalPage;
	}
	
	public ReviewBoardVO getVo() {
		return vo;
	}


}
