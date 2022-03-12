package com.everyparking.admin.framework.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.vo.Ajax;
import com.everyparking.admin.framework.file.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.everyparking.admin.framework.test.service.TestService;
import com.everyparking.admin.framework.common.util.FileUtil;
import com.everyparking.admin.framework.common.view.PoiExcelDownView;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class TestController extends BaseController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private FileUtil fileUtil;

	@Autowired
	private FileService fileService;
	
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


	// 에디터용
	@ResponseBody
	@RequestMapping("imageUpload")
	public Map<String, Object> imageUpload(
			@RequestParam("upload") MultipartFile image,
			HttpServletRequest request) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(image != null) {

			/** 요청 url 가져오기  **/
			String url = request.getRequestURL().toString();
			url = url.substring(0, url.indexOf("/", 7));
			url += "/" + "uploadImage";

			String imgPath = fileUtil.editorImg(image, "editor");

			String originalName = image.getOriginalFilename();
			data.put("uploaded", 1);
			data.put("fileName", originalName);
			data.put("url", url + "/" + imgPath);
		}
		return data;
	}

	@RequestMapping("/fileUploadTestForm")
	public String fileUploadTestForm(){
		return "/test/fileUploadTestForm";
	}

	@ResponseBody
	@RequestMapping("/testlogin")
	public ModelAndView testlogin(HttpServletRequest request) throws Exception {
		HashMap<String,Object> params = new HashMap<>();
		params.put("USER_SEQ", 0);
		SessionUtil.setSessionData(request, "member", params );
		return super.createMav(Ajax.SEARCH.TEXT+"."+Ajax.TPYE_SUCCESS);
	}


	@RequestMapping("/uploadFileSubmit")
	public String fileUploadTestForm(HttpServletRequest request) throws Exception {
		List<Integer> file_seq = fileService.uploadFile(request, "/test");
		// file_seq를 분류되는 이미지 테이블에 인서트해야합니다.
		return "redirect:/test/fileUploadTestForm";
	}

	@RequestMapping("/test")
	public void test(){}
	
	//uploadTest (ckeditor)
	@ResponseBody
	@RequestMapping("/uploadTest")
	public String uploadTest(String editorData) {
		System.out.println(editorData);
		testService.DBUploadTest(editorData);
		return "sucess";
	}
	
	//uploadTestResult
	@RequestMapping("/uploadResult")
	public String uploadResult(Model model) {
		model.addAttribute("uploadFile", testService.getUploadFile());
		return "/test/uploadFileRead";
	}

}
