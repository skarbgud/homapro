package com.homa.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homa.domain.MemberVO;
import com.homa.service.UserListService;

import oracle.net.aso.e;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@Inject
	UserListService service;
	
	//관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception{
		logger.info("get index");
	}
	
	//회원관리
	@RequestMapping(value = "/userList",method = RequestMethod.GET)
	public void getUserList(Model model) throws Exception{
		logger.info("get userList");
		
		List<MemberVO> userList = service.userList();
		
		model.addAttribute("userList",userList);
		 
	}

	//회원삭제
	@ResponseBody
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public void postUserDelete(@RequestParam(value= "chbox[]") List<String> chArr) throws Exception{
		logger.info("userDelete");
		
		for(String i : chArr) {
			service.userDelete(i);;
		}
	}
	
	
	
	
}
