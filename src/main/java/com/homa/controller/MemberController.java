package com.homa.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homa.domain.MemberVO;
import com.homa.service.MemberService;
import com.homa.utils.Email;
import com.homa.utils.EmailSender;

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
			session.setAttribute("userId", login.getUserId());
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
	// 아이디찾기 폼 
		@RequestMapping(value = "/idfind")
		public String idFindForm() throws Exception {

			logger.info("idfind");

			return "/member/idfind";

		}

		// 아이디찾기 
		@RequestMapping(value = "/idprint")
		public ModelAndView idFind(@ModelAttribute MemberVO vo,HttpServletRequest request,HttpServletResponse response)
				throws Exception {
			response.setContentType("text/html; charset=utf-8"); 
			response.setCharacterEncoding("UTF-8");
			logger.info("idprint");
			PrintWriter out = response.getWriter();
			
			ModelAndView mav = new ModelAndView();
			MemberVO memberList = service.idFind(vo);
			
			if (memberList != null) {
				mav.setViewName("/member/idprint");
				mav.addObject("idprint", memberList);
			} else {
				mav.setViewName("/member/idfind");
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			 
			return mav;
		}

		// 비밀번호찾기 폼
		@RequestMapping(value = "/passwordfind",method = RequestMethod.GET)
		public String passwordFindForm() throws Exception {

			logger.info("passwordfind");

			return "/member/passwordfind";

		}
		@RequestMapping(value = "/passwordfind",method = RequestMethod.POST)
		public String passwordFindPost(MemberVO vo,HttpServletResponse response) throws Exception{ 
			MemberVO user =  service.checkUser(vo);
			response.setContentType("text/html; charset=utf-8"); 
			response.setCharacterEncoding("UTF-8");
			ModelAndView mav = new ModelAndView();
			PrintWriter out = response.getWriter();
			
			if (user != null) {
				passwordFind(vo);
				return "/member/passwordprint";
			} else {
				mav.setViewName("passwordfind");
				out.println("<script>");
				out.println("alert('가입된 아이디가 없거나 잘못입력하셨습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				System.out.println("없는아이디");
				return "/member/passwordfind";
			}
		}	
		
		
		@Autowired
		private EmailSender emailSender;

		@Autowired
		private Email email;
		@Autowired
		private JavaMailSender mailSender;
	
		// 비밀번호찾기(이메일발송)
		@RequestMapping(value = "/passwordprint",method = RequestMethod.GET)
		public String passwordFind(MemberVO vo) throws Exception {
			logger.info("passwordprint post");
			ModelAndView mv = new ModelAndView();
			System.out.println("결과실행");
			
			String USERID = vo.getUserId();
			String EMAIL = vo.getUserEmail();
			String PASSWORD = (service.checkUser(vo)).getUserPass();
			
			if(PASSWORD != null) {
				email.setContent("비밀번호는 "+PASSWORD+" 입니다."); // 이메일로 보낼 메시지
				email.setReceiver(EMAIL); // 받는이의 이메일 주소
				email.setSubject(USERID+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
				try {
					MimeMessage msg = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper 
					= new MimeMessageHelper(msg, true, "UTF-8");
					
					messageHelper.setSubject(email.getSubject());
					messageHelper.setText(email.getContent());
					messageHelper.setTo(email.getReceiver());
					messageHelper.setFrom("homa@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
					msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
					mailSender.send(msg);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("MessagingException");
					e.printStackTrace();
				}				
				return "/member/passwordprint";

			}else {
				return "/member/passwordprint";
			}

		}
		
		// 비밀번호변경
		@RequestMapping(value = "/passwordModify")
		public String passwordModify(MemberVO vo) throws Exception {
			logger.info("passwordmodify");
			service.passwordModify(vo);
			return "redirect:/member/login";
		}

}
