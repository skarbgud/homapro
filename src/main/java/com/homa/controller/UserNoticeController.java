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
import com.homa.domain.ReplyVO;
import com.homa.domain.SearchCriteria;
import com.homa.service.ReplyService;
import com.homa.service.UserNoticeService;
@Controller
@RequestMapping("/notice/*")
public class UserNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(UserNoticeController.class);
	
	@Inject
	UserNoticeService service;

	
	//글목록
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public void list(@ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
		logger.info("get list");
		
		List<NoticeVO> list = service.listSearch(scri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//글조회 GET
	@RequestMapping(value = "/read",method = RequestMethod.GET)
	public void getRead(@RequestParam("no_num")int no_num,@ModelAttribute("scri")SearchCriteria scri, Model model,
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
	//댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String postReplyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply write");
		
		
		
		rttr.addAttribute("no_num",vo.getFb_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/notice/list/read";
	}
}
