package com.spring.biz.reply;

import java.util.List;

public interface ReplyService {

	// 댓글 조회
	public List<ReplyVO> readReply(int bseq) throws Exception;
	
	// 댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	// 댓글 수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public boolean deleteReply(String param) throws Exception;
	
	// 선택된 댓글 조회
	public ReplyVO selectReply(String rseq) throws Exception;
}
