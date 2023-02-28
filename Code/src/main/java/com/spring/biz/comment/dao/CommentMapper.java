package com.spring.biz.comment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.biz.comment.CommentLikeVO;
import com.spring.biz.comment.CommentVO;

public interface CommentMapper {

	/* 코멘트 */

	// 코멘트 작성
	public void insertComment(Map<String, Object> map);

	// 코멘트 작성 여부 확인(1->기록있음,0->기록없음)
	@Select("SELECT COUNT(*) FROM comments WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public int checkComment(CommentVO comment);

	// 코멘트 한 건 vo로 반환(영화,회원일치하는 레코드)
	@Select("SELECT * FROM comments WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public CommentVO getComment(CommentVO comment);

	// 코멘트 수정
	@Update("UPDATE comments SET content=#{content}  WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public void updateComment(CommentVO commentVO);

	// 코멘트 삭제
	@Delete("DELETE FROM comments WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public void deleteComment(CommentVO commentVO);

	// 코멘트 목록 불러오기
	@Select("SELECT a.*, s.star FROM (SELECT d.name, d.nickname, c.* FROM Users d JOIN comments c ON d.userId=c.userId ) a "
			+ "LEFT OUTER JOIN contents_star s ON a.star_num = s.star_num WHERE a.contents_type=#{contents_type} and a.contents_num=#{contents_num} ORDER BY a.comment_num DESC")
	public List<CommentVO> selectList(CommentVO comment); 

	// 코멘트 상세 정보
	@Select("SELECT c.*, s.star FROM comments c LEFT OUTER JOIN contents_star s ON c.star_num = s.star_num WHERE c.comment_num=#{comment_num}")
	public CommentVO selectComment(int comment_num);

	/* 코멘트 좋아요/댓글 */

	// 코멘트 좋아요
	@Insert("INSERT INTO comment_like (commentlike_num, comment_num, userId) VALUES (comment_like_seq_NEXTVAL(),#{comment_num},#{userId})")
	public void commentLike(CommentVO comment);

	// 코멘트 좋아요 취소
	@Delete("DELETE FROM comment_like WHERE comment_num =#{comment_num} AND userId=#{userId}")
	public void cancelCmtLike(CommentVO comment);

	// 해당 코멘트 좋아요 갯수
	@Select("SELECT COUNT(*) FROM comment_like WHERE comment_num = #{comment_num} GROUP BY comment_num")
	public Integer getCountLike(int comment_num);

	// 코멘트 좋아요 여부 확인
	@Select("SELECT COUNT(*) FROM comment_like WHERE comment_num=#{comment_num} AND userId=#{userId}")
	public int checkCmtLike(CommentVO comment);

	/* 메인/마이 페이지에서 사용 */

	// 가장 코멘트가 많이 달린 컨텐츠 (메인페이지에서 사용)
	@Select("SELECT COUNT(contents_num) count, contents_num  FROM comments WHERE contents_type=#{contents_type} GROUP BY contents_num ORDER BY count(contents_num) DESC")
	public List<CommentVO> getMostCommented(String contents_type);

	// 내 코멘트 목록
	@Select("SELECT star, c.userId,  c.contents_type, c.contents_num, content, c.comment_num FROM comments c "
			+ "LEFT OUTER JOIN contents_star s ON c.star_num = s.star_num WHERE c.userId = #{userId}  ORDER BY c.comment_num DESC" )
	public List<CommentVO> selectListByUserId(String userId);

	// 내가 좋아요한 코멘트 목록
	@Select("SELECT a.*, s.star FROM contents_star s RIGHT OUTER JOIN "
			+ "(SELECT l.commentLike_num, l.userId like_mem, c.userId comment_mem, c.content, c.contents_type, c.contents_num, c.comment_num,c.star_num "
			+ "FROM comment_like l JOIN comments c ON l.comment_num=c.comment_num) a ON a.star_num=s.star_num WHERE like_mem = #{userId} ORDER BY a.commentLike_num DESC")
	public List<CommentLikeVO> selectListLikeByUserId(String userId);
}
