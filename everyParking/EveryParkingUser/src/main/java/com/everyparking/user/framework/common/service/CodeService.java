package com.everyparking.user.framework.common.service;

import java.util.HashMap;
import java.util.List;

public interface CodeService {
	public List<HashMap<String,Object>> getCodeList(HashMap<String,Object> params) throws Exception;
}
