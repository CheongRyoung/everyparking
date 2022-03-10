package com.everyparking.admin.framework.common.view;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Component
public class PoiExcelDown {

	private List<HashMap<String, Object>> data;
	private String sheetName;
	private String fileName;


	public void excelDown(List<HashMap<String, Object>> DBdata, String sheetName, String fileName, HttpServletResponse response) throws Exception {
		this.data = DBdata;
		this.sheetName = sheetName;
		this.fileName = fileName;

		Iterator<String> keys = data.get(0).keySet().iterator();

		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet(sheetName);
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		int cellNum = 0;

		//Header (셀이름)
		row = sheet.createRow(rowNum++);
		while(keys.hasNext()) {
			cell = row.createCell(cellNum++);
			cell.setCellValue(keys.next());
		}

		//Body (셀 값  한줄 한줄 반복문 쓸것)
		for(Map<String, Object> map : data) {
			row = sheet.createRow(rowNum++);
			int i = 0;
			for(String mapkey : map.keySet()) {
				cell = row.createCell(i++);
				cell.setCellValue(map.get(mapkey).toString());
			}
		}

		// 컨텐츠 타입 지정
		response.setContentType("ms-vnd/excel");

		// 파일명 지정
		try {
			fileName = new String(fileName.getBytes("KSC5601"), "8859_1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment;filename="+fileName+".xlsx");

		// 엑셀 파일 쓰기
		try {
			wb.write(response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			wb.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
