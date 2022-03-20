package com.everyparking.admin.api.costManage.service;

import java.util.HashMap;
import java.util.List;

public interface CostManageService {

	 public List<HashMap<String, Object>> selectListCost(HashMap<String, Object> params) throws Exception;

	    public int selectListCountCost(HashMap<String, Object> params) throws Exception;

	    public HashMap<String, Object> selectOneCost(HashMap<String, Object> params) throws Exception;
	    
	    public int insertCost(HashMap<String, Object> params) throws Exception;
	    public int updateCost(HashMap<String, Object> params) throws Exception;
	    public int deleteCost(HashMap<String, Object> params) throws Exception;
	    
	
}
