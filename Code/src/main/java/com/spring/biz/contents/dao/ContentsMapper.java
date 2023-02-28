package com.spring.biz.contents.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.biz.like.LikeVO;
import com.spring.biz.like.StarVO;

public interface ContentsMapper {

	// 별점 등록
	public void insertStar(Map<String,Object> map);

	// 별점 기등록 여부 확인
	@Select("SELECT COUNT(*) FROM contents_star WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public int CheckStar(StarVO star);
	
	// 영화,회원일치하는 별점vo 반환
	@Select("SELECT * FROM contents_star WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public StarVO getStar(StarVO star);
	
	// 별점 수정
	@Update("UPDATE contents_star SET star=#{star} WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public void updateStar(StarVO star);

	// 별점 취소
	@Delete("DELETE FROM contents_star WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public void deleteStar(StarVO star);

	// 보고싶어요	(dcontents_star_seq.nextval)
	@Insert("INSERT INTO contents_like (clike_num, contents_num, contents_type, userId) VALUES ((dcontents_like_seq.NEXTVAL),#{contents_num},#{contents_type},#{userId})")
	public void contentsLike(LikeVO like);

	// 보고싶어요 기등록 여부 확인
	@Select("SELECT COUNT(*) FROM contents_like WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId} ")
	public int checkLike(LikeVO like);

	// 보고싶어요 취소
	@Delete("DELETE FROM contents_like WHERE contents_num=#{contents_num} AND contents_type=#{contents_type} AND userId=#{userId}")
	public void cancelLike(LikeVO like);

	// 보고싶어요가 가장 많은 컨텐츠 (메인에서 사용)
	@Select("SELECT COUNT(contents_num) count, contents_num  FROM contents_like WHERE contents_type=#{contents_type} GROUP BY contents_num ORDER BY count(contents_num) DESC")
	public List<LikeVO> getMostLike(String contents_type);

	// 보고싶어요 목록
	@Select("SELECT * FROM contents_like WHERE userId = #{userId} AND contents_type = #{contents_type}")
	public List<LikeVO> getLikeList(LikeVO like);
	
	// 보고싶어요 개수 확인, 컨텐츠 타입별로 구분해야 하기 때문에 LikeVO에 담아서 저장 (마이페이지에서 사용)
	@Select("SELECT * FROM contents_star WHERE userId = #{userId} AND contents_type = #{contents_type}")
	public List<StarVO> getStarList(StarVO star);

	// 평가(별점)한 목록
	@Select("SELECT count(*) count, contents_type FROM contents_like WHERE userId = #{userId} GROUP BY contents_type")
	public List<LikeVO> getCountLike(String userId);

	// 평가(별점)한 컨텐츠 갯수
	@Select("SELECT count(*) count, contents_type FROM contents_star WHERE userId = #{userId} GROUP BY contents_type")
	public List<StarVO> getCountStar(String userId);

}
