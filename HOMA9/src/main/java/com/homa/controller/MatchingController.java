package com.homa.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homa.domain.MatchingVO;
import com.homa.service.MatchingService;
import com.homa.service.MemberService;

@Controller
@RequestMapping("/matching/*")
public class MatchingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MatchingController.class);
	
	@Inject 
	MatchingService service;
	
	
	//매칭 정보 조회
	@RequestMapping(value = "/matchingRead", method = RequestMethod.GET)
	public String matchingRead(HttpSession session,Model model) throws Exception{
		logger.info("matching read");
		//로그인이 되어있는지 확인
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg",null);
		}
		
		//유저의 아이디 세션에서 가져오기
		String userId = (String)session.getAttribute("userId");

		//매칭정보 조회
	    MatchingVO matchingVO = service.matchingRead(userId);
	    
	    if(matchingVO == null) {
	    	return "/matching/matchingRegist";
	    }
	    else {
	    	model.addAttribute("machingVO",matchingVO);
	    	return "/matching/matchingRead";
	    }
	}
	
	//매칭 정보 등록
	@RequestMapping(value = "/matchingRegist",method =  RequestMethod.GET)
	public void matchingRegist() throws Exception{
		logger.info("matching regist");
	}
	
}
