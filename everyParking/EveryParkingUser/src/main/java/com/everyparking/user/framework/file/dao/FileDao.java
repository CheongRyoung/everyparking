package com.everyparking.user.framework.file.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@Mapper
public interface FileDao {
    public HashMap<String,Object> getFile(HashMap<String,Object> params) throws Exception;
    public int insertFile(HashMap<String,Object> params) throws Exception;
}
