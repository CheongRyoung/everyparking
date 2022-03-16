package com.everyparking.admin.framework.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyparking.admin.framework.common.dao.CommonDao;

@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;
}
