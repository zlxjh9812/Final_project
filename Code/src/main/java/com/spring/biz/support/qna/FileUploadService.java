package com.spring.biz.support.qna;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	
	// 파일 목록
	public List<FileUploadVO> getFileUpload(int boardId);
	
	// 파일 업로드
	public void uploadFile(int boardId, List<MultipartFile> files) throws Exception;
	
	// 파일 삭제
	public void deleteFileById(int fileId);
	
}
