package com.homa.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;
import com.homa.service.ReportService;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Inject
	ReportService service;
	
	//글작성 get
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void getRegist(@RequestParam("fb_num")int fb_num,
			@RequestParam("userId") String userId,
			@RequestParam("userName") String userName,
			HttpSession session,
			Model model,
			ReportVO vo) throws Exception {
		
		logger.info("get regist");
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String rp_reportId = memberVO.getUserId();
		
		vo.setFb_num(fb_num);
		vo.setUserId(userId);
		vo.setRp_reportId(rp_reportId);
		vo.setUserName(userName);
		
		session.setAttribute("report", vo);

		model.addAttribute("regist", vo);
		
	}
	
	//글작성 post
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String postWrite(HttpSession session, ReportVO vo) throws Exception {
		logger.info("post write");

		ReportVO userId = (ReportVO) session.getAttribute("report");
		ReportVO userName = (ReportVO) session.getAttribute("report");
	
		String rp_userId = userId.getUserId();
		String rp_userName = userName.getUserName();
		
		vo.setUserId(rp_userId);
		vo.setUserName(rp_userName);
		
		System.out.println("rp_userName "+rp_userName);
		service.regist(vo);
		return "redirect:/freeBoard/listSearch";
	}
}
