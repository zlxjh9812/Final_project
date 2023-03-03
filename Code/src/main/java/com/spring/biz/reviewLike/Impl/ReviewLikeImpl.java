package com.spring.biz.reviewLike.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.reviewLike.LikeService;
import com.spring.biz.reviewLike.ReviewLikeVO;

@Service("LikeService")
public class ReviewLikeImpl implements LikeService {

	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	
	@Override
	public void ReviewLike(ReviewLikeVO rvo) {
		reviewLikeDAO.ReviewLike(rvo);

	}

	@Override
	public int findLike(ReviewLikeVO rvo) {		
		return reviewLikeDAO.findLike(rvo);
		
	}

	@Override
	public void ReviewUnLike(ReviewLikeVO rvo) {
		reviewLikeDAO.ReviewUnLike(rvo);
		
	}

}
