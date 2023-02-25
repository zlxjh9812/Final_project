package com.spring.biz.UserBlackList;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface UserBlackListService {
	void insertReportUser(UserBlackListVO vo);
	List<UserBlackListVO> getReportUser(SearchCriteria cri);
	void updateReportUser(UserBlackListVO vo);
	UserBlackListVO getUser(UserBlackListVO vo);
	List<UserBlackListVO> getAllUser(SearchCriteria cri);
	int getAllBlackListCount(SearchCriteria cri);
	int getEndDateUserCount(SearchCriteria cri);
	void DeleteReportUser(UserBlackListVO vo);
}
