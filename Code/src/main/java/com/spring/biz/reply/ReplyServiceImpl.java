package com.spring.biz.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int bseq) throws Exception {
		return dao.readReply(bseq);
	}

	// 댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}
	
	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	// 댓글 삭제
	@Override
	public boolean deleteReply(String param) throws Exception {
		return dao.deleteReply(param);
	}
	
	// 선택된 댓글 조회
	@Override
	public ReplyVO selectReply(String rseq) throws Exception {
		return dao.selectReply(rseq);
	}
}
