package com.homa.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homa.domain.NoticeVO;
import com.homa.domain.PageMaker;

import com.homa.domain.SearchCriteria;
import com.homa.service.NoticeService;

@Controller
@RequestMapping("/admin/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	NoticeService service;

	// 글작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		logger.info("get write");
		Object userId= session.getAttribute("member");
		
		model.addAttribute("member",userId);
	}

	// 글작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(NoticeVO vo) throws Exception {
		logger.info("post write");

		service.write(vo);

		return "redirect:/admin/notice/listSearch";
	}

	// 글목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");

		List<NoticeVO> list = service.list();

		model.addAttribute("list", list);
	}

	// 글조회 get
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("no_num") int no_num, @ModelAttribute("scri") SearchCriteria scri, Model model,
			HttpSession session) throws Exception {
		logger.info("get read");

		Object loginInfo = session.getAttribute("member");

		if (loginInfo == null) {
			model.addAttribute("msg", false);
		}

		NoticeVO vo = service.read(no_num);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
	}

	// 글 수 정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("no_num") int no_num, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("get modify");

		NoticeVO vo = service.read(no_num);
		model.addAttribute("modify", vo);
		model.addAttribute("scri", scri);

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("no_num") int no_num, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", no_num);
		model.addAttribute("scri", scri);

	}

	// 글수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(NoticeVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("post modify");

		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/admin/notice/listSearch";

	}

	// 글삭제 POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("no_num") int no_num, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {
		logger.info("post delete");

		service.delete(no_num);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/admin/notice/listSearch";
	}


	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<NoticeVO> list = service.listSearch(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}

}
