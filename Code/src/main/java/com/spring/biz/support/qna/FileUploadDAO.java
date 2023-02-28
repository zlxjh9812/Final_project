package com.spring.biz.support.qna;

import java.util.List;

public interface FileUploadDAO {
	
	public List<FileUploadVO> getFileUploads(int boardId);
	
	public void insertFileUpload(FileUploadVO fileUpload);

}
