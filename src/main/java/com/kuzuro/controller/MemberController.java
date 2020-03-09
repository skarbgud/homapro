package com.kuzuro.controller; 
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kuzuro.domain.MemberVO; 
import com.kuzuro.service.MemberService; 

@Controller 
@RequestMapping("/member/*") 
public class MemberController { 
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);   
	
	@Inject  
	MemberService service;   
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원가입 get 
	@RequestMapping(value = "/register", method = RequestMethod.GET)  
	public void getRegister(HttpSession session,Model model) throws Exception {   
		logger.info("get register");  
		Object loginInfo = session.getAttribute("member");

		if(loginInfo == null) {
		 model.addAttribute("msg", false);
		}
	}  
	
	// 회원가입 post  
	@RequestMapping(value = "/register", method = RequestMethod.POST)  
	public String postRegister(MemberVO vo) throws Exception {   
		logger.info("post resister"); 
		
		//암호화
		//(회원 가입시 입력하는 MemberVO에서,패스워드(getUserPass)만 받아와서 encode로 암호화한뒤,다시 패스워드(setUserPass)에 넣어줌)
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);  
		//암호화 끝
		
		service.register(vo);
		return "redirect:/";   
		}

	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		 logger.info("post login");
		 
		 HttpSession session = request.getSession();
		 MemberVO login = service.login(vo);
		 
		 boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());  
		
		 
		 System.out.println(vo.getUserId());
		 System.out.println(login.getUserId());
		 System.out.println(vo.getUserPass());
		 System.out.println(login.getUserPass());
		 
		 if(login != null && passMatch) {  
			session.setAttribute("member", login);   
		 } else {
		 	session.setAttribute("member", null);
		 	rttr.addFlashAttribute("msg", false);
		 }  
		 
		 /* if(login == null) {
		  session.setAttribute("member", null);
		  rttr.addFlashAttribute("msg", false);
		 } else {
		  session.setAttribute("member", login);
		 } */
		   
		 return "redirect:/";
	}
	  
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 수정 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify()throws Exception{
		logger.info("get modify");
	}
	
	// 회원정보 수정 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
		logger.info("post modify");
		service.modify(vo);
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원 탈퇴 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete() throws Exception {
		logger.info("get delete"); 
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		 logger.info("post delete");
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 String oldPass = member.getUserPass();
		 String newPass = vo.getUserPass();
		 
		 if(!(oldPass.equals(newPass))) {
			 rttr.addFlashAttribute("msg", false);
			 return "redirect:/member/delete";
		 }
		 
		 service.delete(vo);
		 
		 session.invalidate();
		  
		 return "redirect:/";
	}
	
	// 회원 확인
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
}
