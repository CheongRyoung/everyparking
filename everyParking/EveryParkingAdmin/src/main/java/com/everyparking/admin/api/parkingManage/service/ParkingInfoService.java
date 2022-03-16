package com.everyparking.admin.api.parkingManage.service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

public interface ParkingInfoService {
	
    public List<HashMap<String, Object>> selectListParkingInfo(HashMap<String, Object> params) throws Exception;

    public int selectListCountParkingInfo(HashMap<String, Object> params) throws Exception;

    public HashMap<String, Object> selectOneParkingInfo(HashMap<String, Object> params) throws Exception;

    public int insertParkingInfo(HttpServletRequest request, HashMap<String, Object> params) throws Exception;

    public int updateParkingInfo(HttpServletRequest request, HashMap<String, Object> params) throws Exception;

    public int deleteParkingInfo(HashMap<String, Object> params) throws Exception;

    public HashMap<String, Object> selectOneSection(HashMap<String, Object> params) throws Exception;

    public List<HashMap<String, Object>> selectListSection(HashMap<String, Object> params) throws Exception;

    public int insertSection(HashMap<String, Object> params) throws Exception;

    public int updateSection(HashMap<String, Object> params) throws Exception;

    public int deleteSection(HashMap<String, Object> params) throws Exception;
    
    public List<HashMap<String, Object>> selectSubcodeByRY() throws Exception;
}
