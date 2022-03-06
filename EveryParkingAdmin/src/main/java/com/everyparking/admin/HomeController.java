package com.everyparking.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Autowired
	PooledPBEStringEncryptor pooledPBEStringEncryptor;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		logger.info(pooledPBEStringEncryptor.encrypt("org.mariadb.jdbc.Driver"));
		logger.info(pooledPBEStringEncryptor.encrypt("jdbc:mariadb://yonghwi.synology.me:12126/everyparking"));
		logger.info(pooledPBEStringEncryptor.encrypt("dev_parking"));
		logger.info(pooledPBEStringEncryptor.encrypt("tJ2*9Igd7["));

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	public void 청룡메소드() {
		System.out.println("이건 어디로 들어갈까??");
	}
	
	
	int 청룡변수 = 100;
	
	String 청룡문자 = "아입니다";
	public void jmboard() {
		
		int number = 10;
		String name = "jm";
		
		String result = number + name;
	}

	// 테스트 중이니까 짜증나게 하지 말고 그냥 잘 되도록 합시다

	
	public void 청룡메소드1() {
		int aaaaa = 123123123;
		
	}
	
}
