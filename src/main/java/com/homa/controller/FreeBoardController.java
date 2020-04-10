package com.homa.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homa.domain.Criteria;
import com.homa.domain.FreeBoardVO;
import com.homa.domain.MemberVO;
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
	
	//글조회  get
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("fb_num") int fb_num,
			@ModelAttribute("scri") SearchCriteria scri,Model model,HttpSession session) throws Exception{
		logger.info("get read");
		
		FreeBoardVO vo = service.read(fb_num);
		
		String userId = (String)session.getAttribute("userId");
		
		model.addAttribute("loginId",userId);
		model.addAttribute("writeId",vo.getUserId());
		
		
		
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
		
		
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

	
	//댓글 목록
	@ResponseBody
	@RequestMapping(value = "/read/replyList",method = RequestMethod.GET)
	public List<ReplyVO> getReplyList(@RequestParam("fb_num") int fb_num) throws Exception{
		logger.info("get reply list");
		
		List<ReplyVO> reply = RepService.replyList(fb_num);
		
		return reply;
	}
	
	//댓글작성
	@ResponseBody
	@RequestMapping(value = "/read/registReply",method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("regist reply");
		String userId = (String)session.getAttribute("userId");
		
		reply.setUserId(userId);
		
		
		
		RepService.registReply(reply);
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/read/deleteReply", method = RequestMethod.POST)
	public int postReplyDelete(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("post delete reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = RepService.idCheck(reply.getC_num());
		
		if(member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			RepService.deleteReply(reply);
			
			result = 1;
		}
		
		return result;
	}

	//댓글 수정
	@ResponseBody
	@RequestMapping(value = "/read/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("modify reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = RepService.idCheck(reply.getC_num());
		
		if(member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			RepService.modifyReply(reply);
			result = 1;
		}
		
		return result;
	}
}
