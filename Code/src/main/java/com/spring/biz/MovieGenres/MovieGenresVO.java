package com.spring.biz.MovieGenres;

public class MovieGenresVO {

	private int seq;
	private String movieGeners;
	private int count;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMovieGeners() {
		return movieGeners;
	}
	public void setMovieGeners(String movieGeners) {
		this.movieGeners = movieGeners;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "MovieGenresVO [seq=" + seq + ", movieGeners=" + movieGeners + ", count=" + count + "]";
	}

	
	
	
}
