package com.homa.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homa.domain.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//로그인 확인
		MemberVO loginInfo = (MemberVO)session.getAttribute("member");
		
		if(loginInfo == null) {
			session.setAttribute("login", "nolog");
		}
		else {
			session.setAttribute("login", "log");
//			model.addAttribute("login","log");
		}
		
		
		return "home";
	}
	
	
}
