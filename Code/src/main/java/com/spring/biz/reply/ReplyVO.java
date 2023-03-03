package com.spring.biz.reply;

public class ReplyVO {

	private String bseq;
	private String rseq;
	private String content;
	private String writer;
	private String redeleteflag;
	private String regdate;
	private String reparent;
	private String redepth;
	private Integer reorder;

	public String getBseq() {
		return bseq;
	}

	public void setBseq(String bseq) {
		this.bseq = bseq;
	}

	public String getRseq() {
		return rseq;
	}

	public void setRseq(String rseq) {
		this.rseq = rseq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRedeleteflag() {
		return redeleteflag;
	}

	public void setRedeleteflag(String redeleteflag) {
		this.redeleteflag = redeleteflag;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReparent() {
		return reparent;
	}

	public void setReparent(String reparent) {
		this.reparent = reparent;
	}

	public String getRedepth() {
		return redepth;
	}

	public void setRedepth(String redepth) {
		this.redepth = redepth;
	}

	public Integer getReorder() {
		return reorder;
	}

	public void setReorder(Integer reorder) {
		this.reorder = reorder;
	}

	@Override
	public String toString() {
		return "ReplyVO [bseq=" + bseq + ", rseq=" + rseq + ", content=" + content + ", writer=" + writer
				+ ", redeleteflag=" + redeleteflag + ", regdate=" + regdate + ", reparent=" + reparent + ", redepth="
				+ redepth + ", reorder=" + reorder + "]";
	}

}