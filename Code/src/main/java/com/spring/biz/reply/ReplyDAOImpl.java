package com.spring.biz.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int bseq) throws Exception {
		return mybatis.selectList("replyMapper.readReply", bseq);
	}
	
	// 댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
        if (vo.getRseq() == null || "".equals(vo.getRseq())) {
            if (vo.getReparent() != null) {
                ReplyVO replyInfo = mybatis.selectOne("replyMapper.selectReplyParent", vo.getReparent());
                vo.setRedepth(replyInfo.getRedepth());
                vo.setReorder(replyInfo.getReorder() + 1);
                mybatis.update("replyMapper.updateReplyOrder", replyInfo);
            } else {
                Integer reorder = mybatis.selectOne("replyMapper.selectReplyMaxOrder", vo.getBseq());
                vo.setReorder(reorder);
            }
            
            mybatis.insert("replyMapper.writeReply", vo);
        } else {
        	mybatis.insert("replyMapper.updateReply", vo);
        }
    }   
	
	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		mybatis.update("replyMapper.updateReply", vo);
	}
	
	// 댓글 삭제
	@Override
    public boolean deleteReply(String param) {
        Integer cnt = mybatis.selectOne("replyMapper.selectReplyChild", param);
        
        if ( cnt > 0) {
            return false;
        }
        
        mybatis.delete("replyMapper.deleteReply", param);
        
        return true;
	}
	
	// 선택된 댓글 조회
	@Override
	public ReplyVO selectReply(String rno) throws Exception {
		return mybatis.selectOne("replyMapper.selectReply", rno);
	}

}
