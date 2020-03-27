package com.homa.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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

	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");

		MemberVO login = service.login(vo);
		HttpSession session = req.getSession();

		if (login != null) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}

		return "redirect:/";

	}

	// 로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("post signin");

		service.logout(session);

		return "redirect:/";
	}

	// 회원정보 수정 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {
		logger.info("get modify");
	}

	// 회원 가입 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(MemberVO vo) throws Exception {
		logger.info("post modify");
		service.modify(vo);
		return "redirect:/";
	}

	// 회원탈퇴get
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public void getRemove() throws Exception {
		logger.info("get remove");
	}

	// 회원탈퇴 post
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String postRemove(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("post remove");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String oldPass = member.getUserPass();
		String newPass = vo.getUserPass();

		if (!oldPass.equals(newPass)) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/remove";
		}
		service.logout(session);
		service.remove(vo);

		return "redirect:/";
	}

	// 아이디 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idCheck");

		String userId = req.getParameter("userId");
		MemberVO idCheck = service.idCheck(userId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
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
			mav.addObject("member", memberList);
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
	@RequestMapping(value = "/passwordfind")
	public String passwordFindForm() throws Exception {

		logger.info("passwordfind");

		return "/member/passwordfind";

	}

	// 비밀번호찾기
	@RequestMapping(value = "/passwordprint")
	public ModelAndView passwordFind(@ModelAttribute MemberVO vo,HttpServletRequest request) throws Exception {
		logger.info("passwordfind");
		ModelAndView mav = new ModelAndView();
		MemberVO memberList = service.passwordFind(vo);
		mav.setViewName("/member/passwordprint");//아이디가 없어서 안뜸
		//아이디를 넣거나, 쿼리문을 바꾸거나
		mav.addObject("member", memberList);
		return mav;
	}
	
	// 비밀번호변경
	@RequestMapping(value = "/passwordmodify")
	public String passwordModify(MemberVO vo) throws Exception {
		logger.info("passwordmodify");
		service.passwordModify(vo);
		return "redirect:/member/login";
	}
}
