package com.everyparking.user.framework.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.user.framework.common.dao.CodeDao;

@Service
public class CodeServiceImpl implements CodeService{
	
	@Autowired
	CodeDao codeDao;
	
	@Override
	public List<HashMap<String,Object>> getCodeList(HashMap<String,Object> params)throws Exception{
		return codeDao.getCodeList(params);
	}
	

}
