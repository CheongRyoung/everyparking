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

		logger.info(pooledPBEStringEncryptor.encrypt("빈에 등록된 객체가"));
		logger.info(pooledPBEStringEncryptor.encrypt("암호화를 해줍니다"));
		logger.info(pooledPBEStringEncryptor.encrypt("소금도 있습니다"));
		logger.info(pooledPBEStringEncryptor.encrypt("환경변수에 복호화키를 저장합시다"));

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
}
