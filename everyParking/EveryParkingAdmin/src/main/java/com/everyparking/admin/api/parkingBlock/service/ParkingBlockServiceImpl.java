package com.everyparking.admin.api.parkingBlock.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public List<HashMap<String, Object>> getSectionInfo(HashMap<String, Object> params) throws ParseException {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(HashMap<String, Object> temp :  parkingBlockDao.getSectionInfo(params)) {
			temp.put("daterange", params.get("daterange"));
			List<HashMap<String, Object>> useList = parkingBlockDao.getSectionUseList(temp);
			ArrayList<long[]> kanList = null;
			if(useList.size() > 0) {
				for(HashMap<String, Object> useMap : useList){
					Date startDate = formatter.parse(String.valueOf(useMap.get("START")));
					Date endDate = formatter.parse(String.valueOf(useMap.get("END")));
					long start = startDate.getTime();
					long end = endDate.getTime();
					if (kanList == null) {
						long[] tt = {start, end};
						kanList = new ArrayList<long[]>();
						kanList.add(tt);
					} else {
						boolean check = true;
						int kanSize = kanList.size();
						for(int i=0; i<kanList.size(); i++) {
							if(kanList.get(i)[1] < start) {
								long[] tt = {start, end};
								kanList.set(i, tt);
								check = false;
								break;
							}
						}
						if(check) {
							long[] tt = {start, end};
							kanList.add(tt);
						}
					}
				}
				temp.put("SEC_USE", kanList.size());
			}
			resultList.add(temp);
		}
		return resultList;
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
