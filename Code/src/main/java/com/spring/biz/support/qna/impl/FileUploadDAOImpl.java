package com.spring.biz.support.qna.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.support.qna.FileUploadDAO;
import com.spring.biz.support.qna.FileUploadVO;

@Repository
public class FileUploadDAOImpl implements FileUploadDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "com.spring.biz.support.qna.QnaBoardDAO";

	@Autowired
	public FileUploadDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FileUploadVO> getFileUploads(int boardId) {
		return sqlSession.selectList(NAMESPACE + ".getUploadFiles", boardId);
	}

	@Override
	public void insertFileUpload(FileUploadVO fileUpload) {
		sqlSession.insert(NAMESPACE + ".insertFileUpload", fileUpload);
	}
	
	@Override
	public void deleteFileById(int fileId) {
		sqlSession.delete(NAMESPACE + ".deleteFileUploadById", fileId);
	}

}
