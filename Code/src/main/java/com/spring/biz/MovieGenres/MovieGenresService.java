package com.spring.biz.MovieGenres;

import java.util.List;



public interface MovieGenresService {
	public void insertGenres(MovieGenresVO vo);
	public List<MovieGenresVO> getMovieGenres(MovieGenresVO vo);
	public void updateGenres(MovieGenresVO vo);
	public MovieGenresVO validMovieGenres(MovieGenresVO vo);
}
