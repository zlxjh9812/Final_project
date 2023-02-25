package com.spring.biz.MovieGenres.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.MovieGenres.MovieGenresVO;



@Repository
public class MovieGenresDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertGenres(MovieGenresVO vo) {
		mybatis.insert("MovieGenresDAO.insertGenres",vo);
	}
	public void updateGenres(MovieGenresVO vo) {
		mybatis.update("MovieGenresDAO.updateGenres",vo);
	}
	public List<MovieGenresVO> getGenres(MovieGenresVO vo){
		return mybatis.selectList("MovieGenresDAO.getGenresChart",vo);
	}
	public MovieGenresVO getValiedGenres(MovieGenresVO vo) {
		return mybatis.selectOne("MovieGenresDAO.getGensers", vo);
	}
}
