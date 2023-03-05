package com.spring.biz.support.qna;

import java.util.List;

public interface FileUploadDAO {
	
	// 파일 목록
	public List<FileUploadVO> getFileUploads(int boardId);
	
	// 파일 업로드
	public void insertFileUpload(FileUploadVO fileUpload);
	
	// 파일 삭제
	public void deleteFileById(int fileId);

}
