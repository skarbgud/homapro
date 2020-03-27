package com.homa.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homa.domain.MemberVO;
import com.homa.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	  
	// 회원 가입 get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	 logger.info("get login");
	}

	// 회원 가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	 logger.info("post login");
	 
	 service.join(vo);

	 return "redirect:/";
	}
	
	//로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getSignin() throws Exception{
		logger.info("get signin");
	}
	
	//로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post signin");
		
		MemberVO login = service.login(vo);
		HttpSession session = req.getSession();
		

		
		if(login != null) {
			session.setAttribute("member", login);		
		}
		else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/member/login";
		}
		
		return "redirect:/";
		
	}
	
	// 로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("post signin");
		
		service.logout(session);
		
		return "redirect:/";
	}
	
	
	// 아이디 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		 logger.info("post idCheck");
		 
		 String userId = req.getParameter("userId");
		 MemberVO idCheck =  service.idCheck(userId);
		 
		
		 int result = 0;
		 
		 if(idCheck != null) {
		  result = 1;
		 } 
		 
		 return result;
	}
	
	//마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void getmyPage() throws Exception{
		logger.info("get myPage");
	}
	
	//마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String postMyPage(MemberVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get myPage");
		
		MemberVO login = service.passCheck(vo);
		
		if(login==null) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/member/myPage";
		}
		else{
			return "redirect:/member/modify";
		}
	}
	
	
	//회원정보 수정 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get modify");
	}

	//회원 정보 수정 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(MemberVO vo) throws Exception {
		 logger.info("post modify");
		 service.modify(vo);
		 return "redirect:/";
	}

	//회원탈퇴get
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public void getRemove() throws Exception {
		logger.info("get remove");
	}

	//회원탈퇴 post
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String postRemove(MemberVO vo,HttpSession session,RedirectAttributes rttr) throws Exception {
		logger.info("post remove");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String oldPass = member.getUserPass();
		String newPass = vo.getUserPass();
		
		if(!oldPass.equals(newPass)) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/member/remove";
		}
		service.logout(session);
		service.remove(vo);
		
		return "redirect:/";
	}

}
