package com.everyparking.admin.framework.common.service;

import com.everyparking.admin.framework.common.dao.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {

    @Autowired
    CommonDao commonDao;
}
