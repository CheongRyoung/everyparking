package com.everyparking.admin.api.parkingManage.service;

import com.everyparking.admin.api.parkingManage.dao.ParkingInfoDao;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.file.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class ParkingInfoServiceImpl implements ParkingInfoService{
    @Autowired
    ParkingInfoDao parkingInfoDao;

    @Autowired
    FileService fileService;

    @Value("#{file['file.parking_info']}")
    String filePath;

    @Override
    public List<HashMap<String, Object>> selectListParkingInfo(HashMap<String, Object> params) throws Exception {
        return parkingInfoDao.selectListParkingInfo(params);
    }

    @Override
    public int selectListCountParkingInfo(HashMap<String, Object> params) throws Exception {
        return parkingInfoDao.selectListCountParkingInfo(params);
    }

    @Override
    public HashMap<String, Object> selectOneParkingInfo(HashMap<String, Object> params) throws Exception {
        HashMap<String, Object> result = parkingInfoDao.selectOneParkingInfo(params);
        result.put("sections", this.selectListSection(params));
        return result;
    }

    @Override
    public int insertParkingInfo(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
	   // List<Integer> file_seq = fileService.uploadFile(request, filePath);
	   // if(file_seq.size() >= 1){
	   //     params.put("FILE_SEQ", file_seq.get(0));
	   //}

    	String[] SEC_TYPE_arr = (String[]) params.get("SEC_TYPE");  /* 화면의 input name 이 같은 애들은 배열로 넘어옴 .. */
        String[] SEC_COUNT_arr = (String[]) params.get("SEC_COUNT");
        String[] SEC_DIS_arr = (String[]) params.get("SEC_DIS");
        HashMap<String, Object> params2 = new HashMap<>();
        
        parkingInfoDao.insertParkingInfo(params);
        
        // 파라미터에 다시 입력시켜야한다.
        int PARK_SEQ = (int)params.get("PARK_SEQ");
       
        
        String secSeqs = "";

        int i = 0;
        /*섹션 등록*/
        for(String SEC_TYPE : SEC_TYPE_arr) {
            params2.put("PARK_SEQ", PARK_SEQ);
            params2.put("SEC_TYPE", SEC_TYPE);
            params2.put("REG_SEQ", params.get("REG_SEQ"));
            params2.put("SEC_COUNT", SEC_COUNT_arr[i]);
            params2.put("SEC_DIS", SEC_DIS_arr[i]);
            this.insertSection(params2);
            i++;
        }
        return 1;
    }
    

    @Override
    public int updateParkingInfo(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
        /* 파일 업로드 이후( FILE TABLE INSERT까지) SEQ리턴  // 여러파일 가능 ... */
        List<Integer> file_seq = fileService.uploadFile(request, filePath);
        if(file_seq!= null && file_seq.size() >= 1){
            params.put("FILE_SEQ", file_seq.get(0));    /* 결과 가 있을때 파일 SEQ 심어줌.*/
        }

        String[] SEC_TYPE_arr = (String[]) params.get("SEC_TYPE");  /* 화면의 input name 이 같은 애들은 배열로 넘어옴 .. */
        String[] SEC_COUNT_arr = (String[]) params.get("SEC_COUNT");
        String[] SEC_DIS_arr = (String[]) params.get("SEC_DIS");
        /* 인덱스별로 처리 .. */

        HashMap<String, Object> params2 = new HashMap<>();
        String PARK_SEQ = (String) params.get("PARK_SEQ");
        String secSeqs = "";
        int i = 0;
        for(String SEC_TYPE : SEC_TYPE_arr){
            params2.put("PARK_SEQ", PARK_SEQ);
            params2.put("SEC_TYPE", SEC_TYPE);
            /* 기존의 데이터 조회해서 업데이트 or 인서트 처리*/
            HashMap<String,Object> section = this.selectOneSection(params2);
            if(!secSeqs.equals("")){    /* 기존 데이터중 제외할 애들... 수정시 제외*/
                secSeqs+=",";
            }
            if(section!= null){ /* 기존 데이터 존재시 */
                secSeqs += section.get("SEC_SEQ");
                section.put("SEC_COUNT", SEC_COUNT_arr[i]);
                section.put("SEC_DIS", SEC_DIS_arr[i]);
                section.put("MOD_SEQ", params.get("MOD_SEQ"));
                this.updateSection(section);/* 갯수, 할인율 수정 */
            }else{  /* 해당 코드로 미존재시 신규등록해줌 */
                params2.put("REG_SEQ", params.get("REG_SEQ"));
                params2.put("SEC_COUNT", SEC_COUNT_arr[i]);
                params2.put("SEC_DIS", SEC_DIS_arr[i]);
                this.insertSection(params2);
                secSeqs += params2.get("SEC_SEQ");  /* 재 조회할 애들에 제외목록에 추가 */
            }
            i++;
        }

        if(!secSeqs.equals("")) {   /* 신규/ 수정 된 애들이 존재하니? */
            HashMap<String, Object> params3 = new HashMap<>();
            params3.put("PARK_SEQ", PARK_SEQ);
            params3.put("secSeqs", secSeqs);

            /* 등록 /수정 된 애들을 제외하고 모두조회해서 삭제할꺼임 */
            List<HashMap<String, Object>> sections = selectListSection(params3);
            for(HashMap<String, Object> section : sections){
                deleteSection(section);
            }
        }

        return parkingInfoDao.updateParkingInfo(params);
    }

    @Override
    public int deleteParkingInfo(HashMap<String, Object> params) throws Exception {
        return parkingInfoDao.deleteParkingInfo(params);
    }

    @Override
    public List<HashMap<String,Object>> selectListSection(HashMap<String,Object> params) throws Exception{
        return parkingInfoDao.selectListSection(params);
    }

    @Override
    public HashMap<String,Object> selectOneSection(HashMap<String,Object> params) throws Exception{
        return parkingInfoDao.selectOneSection(params);
    }

    @Override
    public int insertSection(HashMap<String,Object> params) throws Exception{
        return parkingInfoDao.insertSection(params);
    }

    @Override
    public int updateSection(HashMap<String,Object> params) throws Exception{
        return parkingInfoDao.updateSection(params);
    }


    @Override
    public int deleteSection(HashMap<String,Object> params) throws Exception{
        return parkingInfoDao.deleteSection(params);
    }

    @Override
    public List<HashMap<String,Object>> selectSubcodeByRY() throws Exception{
    	return parkingInfoDao.selectSubcodeByRY();
    }

}
