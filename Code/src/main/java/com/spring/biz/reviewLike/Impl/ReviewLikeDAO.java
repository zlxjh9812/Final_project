package com.spring.biz.reviewLike.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.reviewLike.ReviewLikeVO;

@Repository
public class ReviewLikeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 좋아요
	public void ReviewLike(ReviewLikeVO rvo) {
		System.out.println("좋아요 + 1");		
		mybatis.insert("ReviewLikeDAO.ReviewLike", rvo);
	}
	
	// 좋아요 확인
	public int findLike(ReviewLikeVO rvo) {
		System.out.println("좋아요 확인");
		return mybatis.selectOne("ReviewLikeDAO.findLike", rvo);
	}
	
	// 게시글 좋아요 취소
	public void ReviewUnLike(ReviewLikeVO rvo) {
		System.out.println("좋아요 -1");
		
		mybatis.delete("ReviewLikeDAO.ReviewUnLike", rvo);
	}
}
