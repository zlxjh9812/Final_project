package com.spring.biz.support.qna.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.support.qna.FileUploadDAO;
import com.spring.biz.support.qna.FileUploadService;
import com.spring.biz.support.qna.FileUploadVO;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	private final FileUploadDAO fileUploadDAO;
	private final ServletContext servletContext;

	@Autowired
	public FileUploadServiceImpl(FileUploadDAO fileUploadDAO, ServletContext servletContext) {
		this.fileUploadDAO = fileUploadDAO;
		this.servletContext = servletContext;
	}

	// 파일 목록
	@Override
	public List<FileUploadVO> getFileUpload(int boardId) {
		return fileUploadDAO.getFileUploads(boardId);
	}

	// 파일 업로드
	@Override
	public void uploadFile(int boardId, List<MultipartFile> files) throws Exception {
		for (MultipartFile file : files) {
			String savedFilePath = saveFile(file);
			FileUploadVO fileUpload = new FileUploadVO();
			fileUpload.setBoardId(boardId);
			fileUpload.setFilePath(savedFilePath);
			fileUploadDAO.insertFileUpload(fileUpload);
		}
	}

	// 파일 저장
	private String saveFile(MultipartFile file) throws Exception {
		String basePath = "/resources/images/";
		String uuid = UUID.randomUUID().toString();
		String originalFilename = file.getOriginalFilename();
		String savedFileName = basePath + uuid + "_" + originalFilename;
		File saveFile = new File(servletContext.getRealPath(savedFileName));
		file.transferTo(saveFile);
		return savedFileName;
	}

	// 파일 삭제
	@Override
	public void deleteFileById(int fileId) {
		fileUploadDAO.deleteFileById(fileId);
	}

}
