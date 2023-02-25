package com.spring.biz.hashTag;

public class HashTagVO {
	
	private int bseq;
	private String tags;
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	@Override
	public String toString() {
		return "HashTagVO [bseq=" + bseq + ", tags=" + tags + "]";
	}
	
	
}
