package com.spring.biz.support.qna;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	
	public List<FileUploadVO> getFileUpload(int boardId);
	
	public void uploadFile(int boardId, List<MultipartFile> files) throws Exception;
	
}
