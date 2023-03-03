package com.spring.biz.reviewLike;

public interface LikeService {

	// 게시글 좋아요
	public void ReviewLike(ReviewLikeVO rvo);
	
	// 게시글 좋아요 취소
	public void ReviewUnLike(ReviewLikeVO rvo);
	
	// 좋아요 확인
	public int findLike(ReviewLikeVO rvo);
}
