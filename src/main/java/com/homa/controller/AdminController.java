package com.homa.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homa.domain.BlackListVO;
import com.homa.domain.MemberVO;
import com.homa.domain.ReportVO;
import com.homa.service.UserListService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	UserListService service;

	// 관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 회원관리
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void getUserList(Model model) throws Exception {
		logger.info("get userList");

		List<MemberVO> userList = service.userList();

		model.addAttribute("userList", userList);

	}

	// 회원삭제
	@ResponseBody
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public void postUserDelete(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		logger.info("userDelete");

		for (String i : chArr) {
			service.userDelete(i);
			;
		}
	}

	// 신고조회
	@RequestMapping(value = "/reportList", method = RequestMethod.GET)
	public void getReportList(Model model) throws Exception {
		logger.info("get reportList");

		List<ReportVO> list = service.list();

		model.addAttribute("report", list);

	}

	// 신고삭제
	@ResponseBody
	@RequestMapping(value = "/reportDelete", method = RequestMethod.POST)
	public void postReportDelete(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		logger.info("reportDelete");

		for (String i : chArr) {
			service.reportDelete(i);
		}
	}

	// 블랙리스트등록 get
	@RequestMapping(value = "/blackRegist", method = RequestMethod.GET)
	public void getBlackRegist(@RequestParam("userId") String userId, @RequestParam("userName") String userName,
			HttpSession session, Model model, BlackListVO vo) throws Exception {
		logger.info("get blackRegist");

		Object loginInfo = session.getAttribute("member");
		if (loginInfo == null) {
			model.addAttribute("msg", false);
		}

		vo.setUserId(userId);
		vo.setUserName(userName);
		System.out.println("이름 " + vo.getUserName() + " , 아이디" + vo.getUserId());

		session.setAttribute("user", vo);

		model.addAttribute("black", vo);
	}

	// 블랙리스트등록 post
	@RequestMapping(value = "/blackRegist", method = RequestMethod.POST)
	public String postBlackRegist(BlackListVO vo, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {
		logger.info("post blackRegist");

		BlackListVO userId = (BlackListVO) session.getAttribute("user");
		BlackListVO userName = (BlackListVO) session.getAttribute("user");

		String blackUserId = userId.getUserId();
		String blackUserName = userName.getUserName();

		vo.setUserId(blackUserId);
		vo.setUserName(blackUserName);

		service.blackRegist(vo);

		return "redirect:/admin/blackList";
	}

	// 블랙리스트 조회
	@RequestMapping(value = "/blackList", method = RequestMethod.GET)
	public void getBlackList(Model model) throws Exception {
		logger.info("get blackList");

		List<BlackListVO> blacklist = service.blacklist();

		model.addAttribute("black", blacklist);

	}

	// 블랙리스트 삭제
	@ResponseBody
	@RequestMapping(value = "/blackDelete", method = RequestMethod.POST)
	public void postBlackDelete(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		logger.info("blackDelete");

		for (String i : chArr) {
			service.blackDelete(i);
		}
	}

}
