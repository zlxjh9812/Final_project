package com.spring.biz.MovieGenres;

public class MovieGenresVO {

	private int seq;
	private String movieGenres;
	private int count;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMovieGenres() {
		return movieGenres;
	}
	public void setMovieGenres(String movieGenres) {
		this.movieGenres = movieGenres;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "MovieGenresVO [seq=" + seq + ", movieGenres=" + movieGenres + ", count=" + count + "]";
	}

	
	
	
}
