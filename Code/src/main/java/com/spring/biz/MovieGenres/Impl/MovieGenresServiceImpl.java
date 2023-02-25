package com.spring.biz.MovieGenres.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.MovieGenres.MovieGenresService;
import com.spring.biz.MovieGenres.MovieGenresVO;

@Service("MovieGenresService")
public class MovieGenresServiceImpl implements MovieGenresService {

	@Autowired
	MovieGenresDAO movieGenresDAO;
	
	@Override
	public List<MovieGenresVO> getMovieGenres(MovieGenresVO vo) {
		return movieGenresDAO.getGenres(vo);
	}
	
	@Override
	public void insertGenres(MovieGenresVO vo) {
		movieGenresDAO.insertGenres(vo);
	}
	
	@Override
	public void updateGenres(MovieGenresVO vo) {
		movieGenresDAO.updateGenres(vo);
	}
	
	@Override
	public MovieGenresVO validMovieGenres(MovieGenresVO vo) {	
	 return movieGenresDAO.getValiedGenres(vo);
	}
	
}
