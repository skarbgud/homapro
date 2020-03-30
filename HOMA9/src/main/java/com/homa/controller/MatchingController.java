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


@Controller
@RequestMapping("/matching/*")
public class MatchingController {
	
	private static final Logger logger = LoggerFactory.getLogger(MatchingController.class);
	
	@Inject 
	MatchingService service;
	
	@RequestMapping(value = "/matchingIndex",method = RequestMethod.GET)
	public String matchingIndex(HttpSession session,Model model) throws Exception{
		logger.info("mathcing Index");
		//유저의 아이디 세션에서 가져오기
		String userId = (String)session.getAttribute("userId");

		//매칭정보 조회
	    MatchingVO matchingVO = service.matchingRead(userId);
	    
	    if(matchingVO == null) {
	    	return "redirect:/matching/matchingRegist";
	    }
	    else {
	    	model.addAttribute("machingVO",matchingVO);
	    	return "redirect:/matching/matchingRead";
	    }
	}
	
	//매칭 정보 조회 get
	@RequestMapping(value = "/matchingRead", method = RequestMethod.GET)
	public void matchingRead(HttpSession session,Model model) throws Exception{
		logger.info("matching read");
		String userId = (String)session.getAttribute("userId");
		
		MatchingVO vo = service.matchingRead(userId);
		model.addAttribute("matchingVO", vo);
	}
	
	
	
	//매칭 정보 등록 get
	@RequestMapping(value = "/matchingRegist",method =  RequestMethod.GET)
	public void getMatchingRegist() throws Exception{
		logger.info("getMatching regist");
	}
	
	//매칭정보 등록 post
	@RequestMapping(value = "/matchingRegist",method = RequestMethod.POST)
	public String postMatchingRegitst(MatchingVO vo) throws Exception{
		logger.info("postMatching regtist");
		service.matchingRegist(vo);
		
		return "redirect:/matching/matchingRead";
	}
	
}
