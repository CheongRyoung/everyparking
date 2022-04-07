package com.everyparking.admin.api.parkingManage.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface ParkingInfoDao {
    public List<HashMap<String,Object>> selectListParkingInfo(HashMap<String,Object> params) throws Exception;
    public int selectListCountParkingInfo(HashMap<String,Object> params) throws Exception;
    public HashMap<String,Object> selectOneParkingInfo(HashMap<String,Object> params) throws Exception;
    public int insertParkingInfo(HashMap<String,Object> params) throws Exception;
    public int updateParkingInfo(HashMap<String,Object> params) throws Exception;
    public int deleteParkingInfo(HashMap<String,Object> params) throws Exception;
    public List<HashMap<String,Object>> selectListSection(HashMap<String,Object> params) throws Exception;
    public HashMap<String,Object> selectOneSection(HashMap<String,Object> params) throws Exception;
    public int insertSection(HashMap<String,Object> params) throws Exception;
    public int updateSection(HashMap<String,Object> params) throws Exception;
    public int deleteSection(HashMap<String,Object> params) throws Exception;
    public List<HashMap<String,Object>> selectSubcodeByRY() throws Exception;
    public HashMap<String, Object> selectParkingInfoFileImage(int PARK_SEQ);
}
