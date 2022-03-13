package com.everyparking.user.framework.common.service;


import com.everyparking.user.framework.common.dao.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;
}
