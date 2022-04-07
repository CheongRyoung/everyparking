package com.everyparking.admin.api.couponManagement.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.couponManagement.dao.CouponDao;
import com.everyparking.admin.framework.file.service.FileService;

@Service
@Transactional(rollbackFor = Exception.class)
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	CouponDao couponDao;
	
	@Autowired
	FileService fileService;
	
	@Value("#{file['file.coupon']}")
    String filePath;

	@Override
	public int insertCoupon(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
		List<Integer> file_seq = fileService.uploadFile(request, filePath);

	    if(file_seq != null){
	        params.put("FILE_SEQ", file_seq.get(0));
	    }		   
	    couponDao.insertCoupon(params);
	    
	    return 1;
	}

	@Override
	public List<HashMap<String, Object>> selectListCoupon(HashMap<String, Object> params) throws Exception {
		return couponDao.selectListCoupon(params);
	}

	@Override
	public int selectListCountCoupon(HashMap<String, Object> params) throws Exception {
		return couponDao.selectListCountCoupon(params);
	}

	@Override
	public int deleteCoupon(HashMap<String, Object> params) throws Exception {
		return couponDao.deleteCoupon(params);
	}
	
	

}
