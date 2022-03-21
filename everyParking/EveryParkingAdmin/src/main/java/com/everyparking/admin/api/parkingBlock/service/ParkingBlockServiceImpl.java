package com.everyparking.admin.api.parkingBlock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.everyparking.admin.api.parkingBlock.dao.ParkingBlockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = Exception.class)
public class ParkingBlockServiceImpl implements ParkingBlockService {
	
	@Autowired
	ParkingBlockDao parkingBlockDao;

	@Override
	public List<HashMap<String, Object>> selectListParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectListParkingBlock(params);
	}

	@Override
	public int selectListCountParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectListCountParkingBlock(params);
	}

	@Override
	public HashMap<String, Object> selectOneParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectOneParkingBlock(params);
	}

	@Override
	public int deleteParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.deleteParkingBlock(params);
	}

	@Override
	public List<HashMap<String, Object>> getSectionInfo(HashMap<String, Object> params) {
		return parkingBlockDao.getSectionInfo(params);
	}

	@Override
	public int insertBlock(HashMap<String, Object> params) {
		List<HashMap<String, Object>> result = parkingBlockDao.getSectionInfo(params);
		Map<String, Object> map = result.get(0);
		int use = Math.toIntExact(Long.valueOf(String.valueOf((map.get("SEC_USE")))));
		int count = (int) map.get("SEC_COUNT");
		int insert = Integer.parseInt(String.valueOf(params.get("INSERT_COUNT")));
		result.clear();
		for(int i=0; i<insert; i++) {
			result.add(params);
		}
		if(count - use >= insert) {
			return parkingBlockDao.insertBlock(result);
		} else {
			return -1;
		}
	}


}
