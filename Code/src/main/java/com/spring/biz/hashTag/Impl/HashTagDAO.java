package com.spring.biz.hashTag.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.hashTag.HashTagVO;

@Repository
public class HashTagDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertHashTag(HashTagVO vo) {
		mybatis.insert("HashTagDAO.insertHashTag",vo);
	}
	public List<HashTagVO> getHashTag(HashTagVO vo){
		return mybatis.selectList("HashTagDAO.getHashTag",vo);
	}
	public List<Integer> SearchHashTag(HashTagVO vo) {
		return mybatis.selectList("HashTagDAO.SearchHashTag",vo);
	}
	public void updateHash(HashTagVO vo) {
		mybatis.delete("HashTagDAO.deleteHash", vo);
	}
}
