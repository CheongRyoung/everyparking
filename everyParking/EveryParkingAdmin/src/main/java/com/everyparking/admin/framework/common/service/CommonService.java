package com.everyparking.admin.framework.common.service;

import com.everyparking.admin.framework.common.util.MessageDigestUtil;
import com.everyparking.admin.framework.common.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.framework.common.dao.CommonDao;

import java.util.HashMap;
import java.util.List;

@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;

    public void registerMember(MemberVo vo) {

        //회원가입쪽 비밀번호 해싱
        String password = vo.getUSER_PW();
        password = MessageDigestUtil.getPasswordHashCode(password);
        vo.setUSER_PW(password);

        commonDao.registerMember(vo);
    }

    public MemberVo login(MemberVo vo) {

        //로그인쪽 비밀번호 해싱
        String password = vo.getUSER_PW();
        password = MessageDigestUtil.getPasswordHashCode(password);
        vo.setUSER_PW(password);

        MemberVo result = commonDao.getMemberByIdAndPw(vo);
        return result;
    }

    public boolean isExistId(String USER_MAIL) {

        int count = commonDao.getCountById(USER_MAIL);

        if(count > 0) {
            return true;
        } else {
            return false;
        }
    }

    //우대사항 코드
    public List<HashMap<String, Object>> getSubCodeRoyalUser() {
        return commonDao.getSubCodeRoyalUser();
    }

    //
}
