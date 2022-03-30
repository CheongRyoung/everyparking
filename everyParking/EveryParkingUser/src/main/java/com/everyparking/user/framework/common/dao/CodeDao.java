package com.everyparking.user.framework.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CodeDao {
	public List<HashMap<String,Object>> getCodeList(HashMap<String,Object> params) throws Exception;
}
