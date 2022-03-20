package com.everyparking.admin.api.profitCost.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface ProfitCostService {

    public List<HashMap<String, Object>> selectListProfitCost(HashMap<String, Object> params) throws Exception;
    public int selectListCountProfitCost(HashMap<String, Object> params) throws Exception;
    public HashMap<String, Object> selectOneProfitCost(HashMap<String, Object> params) throws Exception;
    public int deleteProfitCost(HashMap<String, Object> params) throws Exception;
    
    // 작성자 : 전지나 | 내용 : profitChart
    public List<HashMap<String, Object>> selectChartByParkSeq(HashMap<String, Object> params) throws Exception;

    // 작성자 : 전지나 | 내용 : profitChart
    List<HashMap<String, Object>> selectChartByParkSeq() throws Exception;
    //public List<HashMap<String, Object>> selectReservationPriceByParkSeq(int PARK_SEQ) throws Exception;
    //public List<HashMap<String, Object>> selectCostPriceByParkSeq(int PARK_SEQ) throws Exception;
}
