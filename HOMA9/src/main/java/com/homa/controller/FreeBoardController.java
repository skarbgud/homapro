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

import com.homa.domain.Criteria;
import com.homa.domain.FreeBoardVO;
import com.homa.domain.PageMaker;
import com.homa.domain.ReplyVO;
import com.homa.domain.SearchCriteria;
import com.homa.service.FreeBoardService;
import com.homa.service.ReplyService;

@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	FreeBoardService service;
	
	@Inject
	ReplyService RepService;
	
	//글작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception{
		logger.info("get write");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
	}
	
	//글작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(FreeBoardVO vo) throws Exception{
		logger.info("post write");
		
		service.write(vo);
		
		return "redirect:/freeBoard/listSearch";
	}
	
	//글목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		logger.info("get list");
		
		List<FreeBoardVO>list = service.list();
		
		model.addAttribute("list",list);	
	}
	
	//글조회 get
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("fb_num") int fb_num,
			@ModelAttribute("scri") SearchCriteria scri,Model model, HttpSession session) throws Exception{
		logger.info("get read");
	
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
		
		FreeBoardVO vo = service.read(fb_num);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		
		List<ReplyVO> repList = RepService.readReply(fb_num);
		model.addAttribute("repList", repList);
	}
	
	 // 글 수 정
	 @RequestMapping(value = "/modify", method = RequestMethod.GET)
	 public void getModify(@RequestParam("fb_num") int fb_num,
			 @ModelAttribute("scri") SearchCriteria scri,  Model model) throws Exception {
	  logger.info("get modify");
	  
	  FreeBoardVO vo = service.read(fb_num);
	  model.addAttribute("modify",vo);
	  model.addAttribute("scri",scri);
	  
	 
	  
	  
	 } 
	 
	 // 글 삭제
	 @RequestMapping(value = "/delete", method = RequestMethod.GET)
	 public void getDelete(@RequestParam("fb_num") int fb_num,
			 @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	  logger.info("get delete");
	    
	  model.addAttribute("delete", fb_num);
	  model.addAttribute("scri",scri);
	  
	 }
	
	//글수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(FreeBoardVO vo,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("post modify");
		
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/freeBoard/listSearch";
			
	}
	
	//글삭제 POST
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public String postDelete(@RequestParam("fb_num") int fb_num,
			@ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("post delete");
		
		service.delete(fb_num);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/freeBoard/listSearch";
	}
	
	//글목록+페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("get list page");
		
		List<FreeBoardVO>list = service.listPage(cri);
		model.addAttribute("list",list);	
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("get list search");
		
		List<FreeBoardVO> list = service.listSearch(scri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}

	
	
	
	//댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String postReplyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply write");
		
		RepService.writeReply(vo);
		
		rttr.addAttribute("fb_num",vo.getFb_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/freeBoard/read";
	}
	
	//댓글 수정
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply update");
		
		RepService.replyUpdate(vo);
		
		rttr.addAttribute("fb_num",vo.getFb_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/freeBoard/read";
	}
	
	//댓글 삭제
	@RequestMapping(value = "/replyDelete",method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply delete");
		
		RepService.replyDelete(vo);
		
		rttr.addAttribute("fb_num",vo.getFb_num());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType",scri.getSearchType());
		rttr.addAttribute("keyword",scri.getKeyword());
		
		return "redirect:/freeBoard/read";
	}
	
	
	
	//댓글 수정 GET
	@RequestMapping(value = "/replyUpdate",method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("c_num") int c_num,
							@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("reply update");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(c_num);
		
		model.addAttribute("readReply",vo);
		model.addAttribute("scri",scri);
	}
	
	//댓글 삭제 GET
	@RequestMapping(value = "/replyDelete",method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("c_num") int c_num,
							@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("reply delete");
		
		ReplyVO vo = null;
		
		vo = RepService.readReplySelect(c_num);
		
		model.addAttribute("readReply",vo);
		model.addAttribute("scri",scri);
	}
	
	
	
}
