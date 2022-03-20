package com.everyparking.admin.api.userhistory.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.userhistory.dao.UserHistoryDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserHistoryServiceImpl implements UserHistoryService{

	@Autowired
	UserHistoryDao userHistoryDao;
	
	
	@Override
    public List<HashMap<String, Object>> selectListHistory(HashMap<String, Object> params) throws Exception {
        return userHistoryDao.selectListHistory(params);
    }

    @Override
    public int selectListCountHistory(HashMap<String, Object> params) throws Exception {
        return userHistoryDao.selectListCountHistory(params);
    }

    @Override
    public HashMap<String, Object> selectOneHistory(HashMap<String, Object> params) throws Exception {
        HashMap<String, Object> result = userHistoryDao.selectOneHistory(params);
        return result;
    }

    
    }
    
   
	

