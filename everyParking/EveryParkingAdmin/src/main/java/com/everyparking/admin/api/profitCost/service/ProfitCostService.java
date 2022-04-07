package com.everyparking.admin.api.profitCost.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

public interface ProfitCostService {

    public List<HashMap<String, Object>> selectListProfitCost(HashMap<String, Object> params) throws Exception;
    public int selectListCountProfitCost(HashMap<String, Object> params) throws Exception;
    public HashMap<String, Object> selectOneProfitCost(HashMap<String, Object> params) throws Exception;
    public int deleteProfitCost(HashMap<String, Object> params) throws Exception;
    
    // 작성자 : 전지나 | 내용 : profitChart
    public List<HashMap<String, Object>> selectChartByParkSeqAndYear(HashMap<String,Object> params) throws Exception;
    public List<HashMap<String, Object>> selectCostChartByParkSeqAndYear(HashMap<String, Object> params) throws Exception;
    public List<HashMap<String, Object>> selectSearchYear() throws Exception;
}
