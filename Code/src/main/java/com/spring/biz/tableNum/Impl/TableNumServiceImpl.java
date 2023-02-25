package com.spring.biz.tableNum.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.tableNum.TableNumService;
import com.spring.biz.tableNum.TableNumVO;

@Service("tableNumService")
public class TableNumServiceImpl implements TableNumService{
	
	@Autowired
	private TableNumDAO tableNumDAO;
	
	@Override
	public String getValue(TableNumVO vo) {
		return tableNumDAO.getTableValue(vo);
	}

}
