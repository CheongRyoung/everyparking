package com.everyparking.admin.framework.test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.everyparking.admin.framework.test.service.TestService;
import com.everyparking.admin.framework.common.util.FileUtil;
import com.everyparking.admin.framework.common.view.ExcelView;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private TestService test;

	@Autowired
	private ExcelView excelView;
	
	@RequestMapping("/adminHome")
	public String test1() {
		return "/parkingManage/adminHome";
	}
	
	@RequestMapping("/parkingZone")
	public String test2() {
		return "/parkingManage/parkingZone";
	}
	
	@RequestMapping("/parkingRegister1")
	public String test3() {
		return "/parkingManage/parkingRegister1";
	}
	
	@RequestMapping("/parkingRegister2")
	public String test4() {
		return "/parkingManage/parkingRegister2";
	}
	
	@RequestMapping("/parkingRegister3")
	public String test5() {
		return "/parkingManage/parkingRegister3";
	}
	
	@RequestMapping("/parkingRevise1")
	public String test6() {
		return "/parkingManage/parkingRevise1";
	}
	
	@RequestMapping("/parkingRevise2")
	public String test7() {
		return "/parkingManage/parkingRevise2";
	}
	
	@RequestMapping("/parkingRevise3")
	public String test8() {
		return "/parkingManage/parkingRevise3";
	}
	
	@RequestMapping("/parkingBlock")
	public String test9() {
		return "/parkingBlock/parkingBlock";
	}
	
	@RequestMapping("/parkingBlockRegister")
	public String test10() {
		return "/parkingBlock/parkingBlockRegister";
	}
	
	@RequestMapping("/costTable")
	public String test12() {
		return "/profitCost/costTable";
	}
	
	@RequestMapping("/costInsertForm")
	public String test12_1() {
		return "/profitCost/costInsertForm";
	}
	
	@RequestMapping("/profitTable")
	public String test13() {
		return "/profitCost/profitTable";
	}
	
	@RequestMapping("/profitChart")
	public String test14() {
		return "/profitCost/profitChart";
	}
	
	@RequestMapping("/reservationInquiry")
	public String test15() {
		return "/profitCost/reservationInquiry";
	}
	
	@RequestMapping("/qnaManagement")
	public String test16() {
		return "/parkingManage/qnaManagement";
	}
	
	@RequestMapping("/noticeManagement")
	public String test17() {
		return "/parkingManage/noticeManagement";
	}
	
	@RequestMapping("/noticeInsertForm")
	public String test18() {
		return "/parkingManage/noticeInsertForm";
	}
	
	//엑셀  파일 다운로드 request 
	//다운로드 후 별다른 행위를 하지 않기 때문에 void
	@RequestMapping("/excelDownload")
	public ModelAndView excelDownload(HttpServletResponse response) {
		
		// ExcelDounloadUtil 객체 인스턴스시 생성자에 파라미터 입력 
		// 첫번째 파라미터 db에서 선별된 데이터 테이블(ArrayList<Map<String, Object>>)만 받으니 select시 map 리스트로 리턴 받을 것
		// 두번째 파라미터는 엑셀에서 보면 테이블 시트의 이름이 있는데 그걸 지정해줌(테이블 시트는 하나만 생성됨, 여러개 원할시 말씀해주세요)
		// 세번째 파라미터는 엑셀파일명을 어떻게 할지 적어주면됨 추가적으로 기간별 정보를 가져왔을 때 이 이름에 기간을 넣어주면 ++

		Map<String,Object> excelMap = new HashMap<String,Object>();
		excelMap.put("DBdata", test.getDBTest());
		excelMap.put("sheetName", "테스트시트명");
		excelMap.put("filename", "test파일명123!@#_");
		// ExcelDounloadUtil 객체의 excelDownload메소드를 사용 응답을 해줘야 되니 response 꼭 필요
		return new ModelAndView(excelView, excelMap);
	}
	
	
	// 에디터용
	@ResponseBody
	@RequestMapping("imageUpload")
	public Map<String, Object> imageUpload(@RequestParam("upload") MultipartFile image) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(image != null) {
			String originalName = image.getOriginalFilename();
			FileUtil imgSaveFolder = new FileUtil(image);
			String imgPath = imgSaveFolder.imgSave();
			
			data.put("uploaded", 1);
			data.put("fileName", originalName);
			data.put("url", "http://localhost:8123" + imgPath);
		}
		return data;
	}
	
	//uploadTest (ckeditor)
	@ResponseBody
	@RequestMapping("/uploadTest")
	public String uploadTest(String editorData) {
		System.out.println(editorData);
		test.DBUploadTest(editorData);
		return "sucess";
	}
	
	//uploadTestResult
	@RequestMapping("/uploadResult")
	public String uploadResult(Model model) {
		model.addAttribute("uploadFile", test.getUploadFile());
		return "/test/uploadFileRead";
	}

}
