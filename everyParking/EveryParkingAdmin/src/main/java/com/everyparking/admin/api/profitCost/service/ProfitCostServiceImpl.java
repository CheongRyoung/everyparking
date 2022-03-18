package com.everyparking.admin.api.profitCost.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.profitCost.dao.ProfitCostDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProfitCostServiceImpl implements ProfitCostService{
	
	@Autowired
	ProfitCostDao profitCostDao;
	
	
	
	@Override
    public List<HashMap<String, Object>> selectListProfitCost(HashMap<String, Object> params) throws Exception {
        return profitCostDao.selectListProfitCost(params);
    }

    @Override
    public int selectListCountProfitCost(HashMap<String, Object> params) throws Exception {
        return profitCostDao.selectListCountProfitCost(params);
    }

    @Override
    public HashMap<String, Object> selectOneProfitCost(HashMap<String, Object> params) throws Exception {
        HashMap<String, Object> result = profitCostDao.selectOneProfitCost(params);
        return result;
    }

    @Override
    public int deleteProfitCost(HashMap<String, Object> params) throws Exception {
    	
    	Iterator<String> key = params.keySet().iterator();
    	
    	String cost = "COST_SEQ";

    	if(key.next().equals(cost)){
    		return profitCostDao.deleteProfitCost(params);
    	}else {
    		return profitCostDao.deleteProfitCostRese(params);
    	}
    }
    
    // 작성자 : 전지나 | 내용 : profitChart
    @Override
    public List<HashMap<String, Object>> selectProfitChartDataByMonth() throws Exception {  	
    	List<HashMap<String, Object>> totalListByYearMonth = profitCostDao.selectProfitChartDataByMonth();
    	return totalListByYearMonth;
    }
}
