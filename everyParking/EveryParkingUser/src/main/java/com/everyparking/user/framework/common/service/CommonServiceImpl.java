package com.everyparking.user.framework.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.user.framework.common.dao.CommonDao;
import com.everyparking.user.framework.common.util.MessageDigestUtil;
import com.everyparking.user.framework.common.vo.MemberVo;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommonServiceImpl implements CommonService {

    @Autowired
    CommonDao commonDao;
    
    @Override
    public void registerMember(MemberVo vo, String [] SUB_CODE) throws Exception {
    	
    	//회원가입쪽 비밀번호 해싱
    	String password = vo.getUSER_PW();
    	password = MessageDigestUtil.getPasswordHashCode(password);
    	vo.setUSER_PW(password);
    	
    	commonDao.registerMember(vo);
    	
    	//우대사항리스트 
    	for(String e : SUB_CODE) {
    		HashMap<String, Object> map = new HashMap<>();
    		
    		map.put("USER_SEQ", vo.getUSER_SEQ());
    		map.put("RU_TYPE", e);
    		
    		
    		commonDao.insertRoyalUser(map);
    	}
    }
    
    @Override
	public int insertRoyalUser(HashMap<String, Object> params) throws Exception {
		return commonDao.insertRoyalUser(params);
	}
    
    @Override
	public MemberVo login(MemberVo vo) {
		
		//로그인쪽 비밀번호 해싱
    	String password = vo.getUSER_PW();
    	password = MessageDigestUtil.getPasswordHashCode(password);
    	vo.setUSER_PW(password);
    	
		MemberVo result = commonDao.getMemberByIdAndPw(vo);
		return result;
	}
	
	//우대사항 코드
    @Override
	public List<HashMap<String, Object>> getSubCodeRoyalUser() throws Exception {
		return commonDao.getSubCodeRoyalUser();
	}
	
    //이메일 찾기
    @Override
    public MemberVo findEmail(MemberVo vo) {
    	
    	MemberVo result = commonDao.findEmail(vo);
    	
    	return result;
    }
	
    //이메일 중복확인
    @Override
	public boolean isExistEmail(String USER_MAIL) {
		
		int count = commonDao.getCountByEmail(USER_MAIL);
		
		if(count > 0) {
			return true;
		} else {
			return false;
		}
	}
    
    //차량번호 중복확인
    @Override
   	public boolean isExistCarNo(String USER_CAR_NO) {
   		
   		int count = commonDao.getCountByCarNo(USER_CAR_NO);
   		
   		if(count > 0) {
   			return true;
   		} else {
   			return false;
   		}
   	}
	
	

}
