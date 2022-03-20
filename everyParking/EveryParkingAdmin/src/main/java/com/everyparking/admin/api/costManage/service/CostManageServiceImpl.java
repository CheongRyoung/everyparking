package com.everyparking.admin.api.costManage.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.costManage.dao.CostManageDao;
import com.everyparking.admin.api.profitCost.dao.ProfitCostDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class CostManageServiceImpl implements CostManageService{
	
	@Autowired
	CostManageDao costManageDao;
	
	
	
	@Override
    public List<HashMap<String, Object>> selectListCost(HashMap<String, Object> params) throws Exception {
        return costManageDao.selectListCost(params);
    }

    @Override
    public int selectListCountCost(HashMap<String, Object> params) throws Exception {
        return costManageDao.selectListCountCost(params);
    }

    @Override
    public HashMap<String, Object> selectOneCost(HashMap<String, Object> params) throws Exception {
        HashMap<String, Object> result = costManageDao.selectOneCost(params);
        return result;
    }


    @Override
    public int insertCost(HashMap<String, Object> params) throws Exception {
    	return costManageDao.insertCost(params);
    }
    	

    @Override
    public int updateCost(HashMap<String, Object> params) throws Exception {
    	return costManageDao.updateCost(params);
    }
    	
    
    @Override
    public int deleteCost(HashMap<String, Object> params) throws Exception {
    	
    	Iterator<String> key = params.keySet().iterator();
    	
    	String cost = "COST_SEQ";

    	if(key.next().equals(cost)){
    		return costManageDao.deleteCost(params);
    	}else {
    		return costManageDao.deleteCostRese(params);
    	}
    }
    
   
}
