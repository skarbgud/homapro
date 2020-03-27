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

import com.homa.domain.FreeBoardVO;
import com.homa.domain.MemberVO;
import com.homa.domain.PageMaker;
import com.homa.domain.ReplyVO;
import com.homa.domain.ReportVO;
import com.homa.domain.SearchCriteria;
import com.homa.service.ReportService;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Inject
	ReportService service;

	//글작성 get
		@RequestMapping(value = "/regist", method = RequestMethod.GET)
		public void getWrite(HttpSession session, Model model) throws Exception{
			logger.info("get write");
			
			Object loginInfo = session.getAttribute("member");
			
			if(loginInfo == null) {
				model.addAttribute("msg",false);
			}
		}
		
		//글작성 post
		@RequestMapping(value = "/regist", method = RequestMethod.POST)
		public String postWrite(ReportVO vo) throws Exception{
			logger.info("post write");
			
			service.regist(vo);
			
			return "redirect:/report/list";
		}
		
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");

		List<ReportVO> list = service.list(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	//글조회 get
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("rp_num") int rp_num,
			@ModelAttribute("scri") SearchCriteria scri,Model model, HttpSession session) throws Exception{
		logger.info("get read");
	
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
		
		
		
		
		ReportVO vo = service.read(rp_num);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		
	}
	 // 글 삭제 get
	 @RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public void getDelete(@RequestParam("rp_num") int rp_num,
			 @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	  logger.info("get delete");
	    
	  model.addAttribute("delete", rp_num);
	  model.addAttribute("scri",scri);
	  
	 }
	//글삭제 POST
		@RequestMapping(value = "/delete",method = RequestMethod.POST)
		public String postDelete(@RequestParam("rp_num") int rp_num,
				@ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("post delete");
			
			service.delete(rp_num);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum",scri.getPerPageNum());
			rttr.addAttribute("searchType",scri.getSearchType());
			rttr.addAttribute("keyword",scri.getKeyword());
			
			return "redirect:/report/list";
		}
		
		 // 글 수 정  get
		 @RequestMapping(value = "/modify", method = RequestMethod.GET)
		 public void getModify(@RequestParam("rp_num") int rp_num,
				 @ModelAttribute("scri") SearchCriteria scri,  Model model) throws Exception {
		  logger.info("get modify");
		  
		  ReportVO vo = service.read(rp_num);
		  model.addAttribute("modify",vo);
		  model.addAttribute("scri",scri);
		  
		 } 
		//글수정 POST
			@RequestMapping(value = "/modify", method = RequestMethod.POST)
			public String postModify(ReportVO vo,
					@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
				logger.info("post modify");
				
				service.update(vo);
				
				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum",scri.getPerPageNum());
				rttr.addAttribute("searchType",scri.getSearchType());
				rttr.addAttribute("keyword",scri.getKeyword());
				
				return "redirect:/report/list";
					

			}

		
}
