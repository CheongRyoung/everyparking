package com.everyparking.admin.api.parkingBlock.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface ParkingBlockDao {
	
	public List<HashMap<String, Object>> selectListParkingBlock(HashMap<String, Object> params) throws Exception;
	public int selectListCountParkingBlock(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneParkingBlock(HashMap<String, Object> params) throws Exception;
    public int deleteParkingBlock(HashMap<String,Object> params) throws Exception;
	public List<HashMap<String, Object>> getSectionInfo(HashMap<String, Object> params);
	public List<HashMap<String, Object>> getSectionUseList(HashMap<String, Object> params);
	public int insertBlock(List<HashMap<String, Object>> result);
}
