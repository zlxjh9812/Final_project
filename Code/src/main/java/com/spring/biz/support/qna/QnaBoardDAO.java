package com.spring.biz.support.qna;

import java.util.List;

import com.spring.biz.support.util.SearchCriteria;

public interface QnaBoardDAO {

	public int getBoardCount();

	public int getMyBoardCount(SearchCriteria criteria, String userId);

	public List<QnaBoardVO> getBoardList(SearchCriteria criteria);

	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId);

	public QnaBoardVO getBoard(int boardId);

	public QnaBoardVO insertBoard(QnaBoardVO qnaBoardVO);

	public void insertFileUpload(FileUploadVO fileUploadVO);

}
