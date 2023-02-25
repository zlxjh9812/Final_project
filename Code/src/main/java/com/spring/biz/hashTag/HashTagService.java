package com.spring.biz.hashTag;

import java.util.List;

public interface HashTagService {
	public void insertHashTag(HashTagVO vo);
	
	public List<HashTagVO> getHashTag(HashTagVO vo);

	public List<Integer> SearchHashTag(HashTagVO vo);
	
	public void updateHashTag(HashTagVO vo);
}
