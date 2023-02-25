package com.spring.biz.hashTag.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.hashTag.HashTagService;
import com.spring.biz.hashTag.HashTagVO;

@Service("HashTagService")
public class HashTagServiceImpl implements HashTagService {

	@Autowired
	private HashTagDAO hashtagDAO;
	@Override
	public void insertHashTag(HashTagVO vo) {
		hashtagDAO.insertHashTag(vo);
		
	}

	@Override
	public List<HashTagVO> getHashTag(HashTagVO vo) {
		// TODO Auto-generated method stub
		return hashtagDAO.getHashTag(vo);
	}

	@Override
	public List<Integer> SearchHashTag(HashTagVO vo) {
		// TODO Auto-generated method stub
		return hashtagDAO.SearchHashTag(vo);
	}

	@Override
	public void updateHashTag(HashTagVO vo) {
		hashtagDAO.updateHash(vo);

		
	}
}
