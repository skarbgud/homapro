package com.homa.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homa.domain.ListPageMaker;
import com.homa.domain.PageMaker;
import com.homa.domain.RoomVO;
import com.homa.domain.SearchCriteria;
import com.homa.domain.SearchListCriteria;
import com.homa.service.RoomService;
import com.homa.utils.UploadFileUtils;

@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Inject
	RoomService service;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//방목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("scri")SearchListCriteria scri, Model model) throws Exception{
		logger.info("get room list");
		
		List<RoomVO> list = service.list(scri);
		model.addAttribute("list", list);
		model.addAttribute("mapList", list);
		
		ListPageMaker listPageMaker = new ListPageMaker();
		listPageMaker.setCri(scri);
		listPageMaker.setTotalCount(service.listCount());
		model.addAttribute("listPageMaker",listPageMaker);
		
	}
	
	//방등록 get
	@RequestMapping(value = "/regist",method = RequestMethod.GET)
	public void getRegist() throws Exception{
		logger.info("get room regist");
	}
	
	//방등록 post
	@RequestMapping(value = "/regist",method = RequestMethod.POST)
	public String postRegist(RoomVO vo,MultipartFile file,HttpServletRequest request) throws Exception{
		logger.info("post room regist");
		

		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file.getOriginalFilename() != null && file.getOriginalFilename()!= "") {
			//파일 인풋박스에 첨부된 파일이 있다면(=첨부된 파일이 이름이 있다면)
			
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			//r_img에 원본 파일 경로 + 파일명 저장
			vo.setR_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		} else {
			//첨부된 파일이 없으면 미리 준비된 none.png로 파일을 대신 출력
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			vo.setR_img(fileName);
		}


		
		service.regist(vo);
		return "redirect:/room/list";
	}
	
	// 방 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void roomRead(@RequestParam("r_num") int r_num, Model model, @ModelAttribute("scri") SearchCriteria scri,HttpServletRequest request)
			throws Exception {
		logger.info("get read");

		RoomVO vo = new RoomVO();	
		vo = service.read(r_num);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);
	}
	
	// 방 수정 get
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getRoomModify(@RequestParam("r_num") int r_num, Model model,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("get modify");
		RoomVO vo = service.read(r_num);
		model.addAttribute("modify", vo);
		model.addAttribute("scri", scri);
	}

	// 방 수정 post
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postRoomModify(RoomVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
				MultipartFile file, HttpServletRequest request) throws Exception {
		logger.info("post modify");

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// 기존 파일을 삭제
			new File(uploadPath + request.getParameter("r_img")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),ymdPath);

			vo.setR_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

			}else { // 새로운 파일이 등록되지 않았다면
				// 기존 이미지를 그대로 사용
			vo.setR_img(request.getParameter("r_img"));
			}
			
			
		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/room/list";
	}
	// 방 삭제
	@RequestMapping(value = "/delete")
	public String roomDelete(@RequestParam("r_num") int r_num) throws Exception {
		logger.info("delete");
		service.delete(r_num);
		return "redirect:/room/list";
	}
}
