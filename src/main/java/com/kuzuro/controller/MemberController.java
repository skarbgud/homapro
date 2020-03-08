package com.kuzuro.controller; 
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import com.kuzuro.domain.MemberVO; 
import com.kuzuro.service.MemberService; 

@Controller 
@RequestMapping("/member/*") 
public class MemberController { 
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);   
	
	@Inject  
	MemberService service;   
	
	// 글 작성 get 
	@RequestMapping(value = "/register", method = RequestMethod.GET)  
	public void getRegister() throws Exception {   
		logger.info("get register");  
	}  
	
	// 글 작성 post  
	@RequestMapping(value = "/register", method = RequestMethod.POST)  
	public String postRegister(MemberVO vo) throws Exception {   
		logger.info("post resister"); 
		service.register(vo);
		return "redirect:/";
		}
	
	// 로그인 
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String login(MemberVO vo, HttpServletRequest request) throws Exception {  
		logger.info("post login");   
		HttpSession session = request.getSession();   
		MemberVO login = service.login(vo);    
		if(login == null) {   
			session.setAttribute("member", null);   
		} 
		else {   
			session.setAttribute("member", login);  
		}     
		return "redirect:/"; 
		}
	  
	
	}
