package com.everyparking.admin.framework.test.controller;

import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.util.FileUtil;
import com.everyparking.admin.framework.common.util.SessionUtil;
import com.everyparking.admin.framework.common.view.PoiExcelDownView;
import com.everyparking.admin.framework.common.vo.Ajax;
import com.everyparking.admin.framework.file.service.FileService;
import com.everyparking.admin.framework.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/test")
public class TestController extends BaseController {
	
	@Autowired
	private TestService testService;

	@Autowired
	private PoiExcelDownView poiExcelDown;
	
	@Autowired
	private FileUtil fileUtil;

	@Autowired
	private FileService fileService;


	//엑셀  파일 다운로드 request  poi.ver
	//다운로드 후 별다른 행위를 하지 않기 때문에 void
	@RequestMapping("/excelDownload")
	public void excelDownload(HttpServletResponse response) throws Exception {
/**
 * 		String name = ImageFolerName.NOTIFICATION;
 * 		ExcelDounloadUtil 객체 인스턴스시 생성자에 파라미터 입력
 * 		첫번째 파라미터 db에서 선별된 데이터 테이블(ArrayList<Map<String, Object>>)만 받으니 select시 map 리스트로 리턴 받을 것
 * 		두번째 파라미터는 엑셀에서 보면 테이블 시트의 이름이 있는데 그걸 지정해줌(테이블 시트는 하나만 생성됨, 여러개 원할시 말씀해주세요)
 * 		세번째 파라미터는 엑셀파일명을 어떻게 할지 적어주면됨 추가적으로 기간별 정보를 가져왔을 때 이 이름에 기간을 넣어주면 ++
 *
 *
 * **/

		Map<String,Object> excelMap = new HashMap<String,Object>();
		excelMap.put("sheetName", "테스트시트명");
		excelMap.put("filename", "test파일명123!@#_");
		// ExcelDounloadUtil 객체의 excelDownload메소드를 사용 응답을 해줘야 되니 response 꼭 필요

	}
	
	
	// 에디터용
	@ResponseBody
	@RequestMapping("imageUpload")
	public Map<String, Object> imageUpload(@RequestParam("upload") MultipartFile image) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(image != null) {
			String originalName = image.getOriginalFilename();
			/**
			 *   -------------------------------
			 *   db에 이미지 기존 이름 저장
			 *   -------------------------------
			 * **/

			/**  new FileUtil(MultipartFile image, enum객체로 폴더 선택)     **/

//			String imgPath = fileUtil.folderPath(image, ImageFolerName.NOTIFICATION);
			/**
			 *   -------------------------------
			 *   db에 이미지 url저장
			 *   -------------------------------
			 * **/

			data.put("uploaded", 1);
			data.put("fileName", originalName);
//			data.put("url", "/uploadImage/" + imgPath);
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
