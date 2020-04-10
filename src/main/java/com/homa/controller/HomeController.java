package com.homa.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homa.domain.ListPageMaker;
import com.homa.domain.MemberVO;
import com.homa.domain.SearchListCriteria;
import com.homa.service.RoomService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	RoomService service;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("scri") SearchListCriteria scri,Locale locale, Model model,HttpSession session) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//로그인 확인
		MemberVO loginInfo = (MemberVO)session.getAttribute("member");
		
		if(loginInfo == null) {
			session.setAttribute("login", "nolog");
		}
		else {
			session.setAttribute("login", "log");     
		}
		
		ListPageMaker listPageMaker = new ListPageMaker();
		listPageMaker.setCri(scri);
		listPageMaker.setTotalCount(service.listCount());
		model.addAttribute("listPageMaker",listPageMaker);
		
		return "home";
	}
	
	
}
