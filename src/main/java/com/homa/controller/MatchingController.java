package com.homa.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homa.domain.MatchingVO;
import com.homa.service.MatchingService;

@Controller
@RequestMapping("/matching/*")
public class MatchingController {

	private static final Logger logger = LoggerFactory.getLogger(MatchingController.class);

	@Inject
	MatchingService service;

	@RequestMapping(value = "/matchingIndex", method = RequestMethod.GET)
	public String matchingIndex(HttpSession session, Model model) throws Exception {
		logger.info("mathcing Index");
		// 유저의 아이디 세션에서 가져오기
		String userId = (String) session.getAttribute("userId");

		// 매칭정보 조회
		MatchingVO matchingVO = service.matchingRead(userId);

		if (matchingVO == null) {
			return "redirect:/matching/matchingRegist";
		} else {
			model.addAttribute("machingVO", matchingVO);
			return "redirect:/matching/matchingRead";
		}
	}

	// 매칭 정보 등록 get
	@RequestMapping(value = "/matchingRegist", method = RequestMethod.GET)
	public void getMatchingRegist() throws Exception {
		logger.info("getMatching regist");
	}

	// 매칭정보 등록 post
	@RequestMapping(value = "/matchingRegist", method = RequestMethod.POST)
	public String postMatchingRegitst(MatchingVO vo) throws Exception {
		logger.info("postMatching regtist");
		service.matchingRegist(vo);

		return "redirect:/matching/matchingRead";
	}
	
	// 매칭 정보 조회 get
	@RequestMapping(value = "/matchingRead", method = RequestMethod.GET)
	public void matchingRead(HttpSession session, Model model) throws Exception {
		logger.info("matching read");
		String userId = (String) session.getAttribute("userId");

		MatchingVO vo = service.matchingRead(userId);
		model.addAttribute("matchingVO", vo);
	}

	// 매칭 정보 조회 post
	@RequestMapping(value = "/matchingRead", method = RequestMethod.POST)
	public String postMatchingRead(HttpSession session,Model model) throws Exception {
		logger.info("postMatching read");
		
		return "redirect:/matching/matchingResult";
		
	}

	// 회원의 매칭정보 불러오기
	@RequestMapping(value = "/matchingResult", method = RequestMethod.GET)
	public void getMatchingResult(HttpSession session,Model model) throws Exception {
		logger.info("getMatchingResult");
		// 현재 사용자의 아이디 가져오기
				String userId = (String) session.getAttribute("userId");

				// 현재 사용자의 매칭정보 가져오기
				MatchingVO vo = service.matchingRead(userId);

				// 전체회원의 매칭정보리스트
				List<MatchingVO> list = service.memberList();

				
				Map<String, Integer> scoreList = new HashMap<String, Integer>();
				
				for (int i = 0; i < list.size(); i++) {
					if (!(list.get(i).getUserId().equals(userId))) {
						// 총점
						int totalscore = 0;

						// 멤버들의 매칭정보중에 하나
						MatchingVO matchingInfo = list.get(i);
					
						String matchingListUserId = list.get(i).getUserId();
						
						// 멤버들 중 매칭정보 직업
						String memberListJob = matchingInfo.getMat_job();
						// 멤버의 직업
						String memberJob = vo.getMat_job();
						// 멤버의 직업 중요도
						int memberJobDetail = vo.getMat_jobDetail();

						if (memberJob.equals(memberListJob)) {
							totalscore += 1 * memberJobDetail;
						} else {
							totalscore += 0 * memberJobDetail;
						}

						// 멤버들 중 매칭정보 취짐시간
						String memberListBed = matchingInfo.getMat_bedTime();

						// 멤버의 취침시간
						String memberBed = vo.getMat_bedTime();

						// 멤버의 취침시간 중요도
						int memberBedDetail = vo.getMat_bedTimeDetail();

						if (memberBed.equals(memberListBed)) {
							totalscore = totalscore + memberBedDetail;
						} else {
							totalscore += 0 * memberBedDetail;
						}

						// 멤버들 중 매칭정보 기상시간
						String memberListWakeUp = matchingInfo.getMat_wakeUp();

						// 멤버의 기상시간
						String memberWakeUp = vo.getMat_wakeUp();

						// 멤버의 기상시간 중요도
						int memberWakeUpDetail = vo.getMat_wakeUpDetail();

						if (memberWakeUp.equals(memberListWakeUp)) {
							totalscore = totalscore + memberWakeUpDetail;
						} else {
							totalscore += 0 * memberWakeUpDetail;
						}
						
						//멤버들 중 매칭정보 음식취향
						String memberListFood = matchingInfo.getMat_food();
						
						//멤버의 음식취향
						String memberFood = vo.getMat_food();
						
						//멤버의 음식취향 중요도
						int memberFoodDetail = vo.getMat_foodDetail();
						
						
						if(memberFood.equals(memberListFood)) {
							totalscore += 1*memberFoodDetail;
						}
						else {
							totalscore += 0*memberFoodDetail;
						}
						
						 //멤버들 중 성별 
				         String memberListGender = matchingInfo.getMat_gender();
				         
				         //멤버의 성별
				         String memberGender = vo.getMat_gender();
				         
				         //멤버의 성별 중요도
				         int memberGenderDetail = vo.getMat_genderDetail();
				         
				         
				         if(memberGender.equals(memberListGender)) {
				            totalscore += 1*memberGenderDetail;
				         }
				         else {
				            totalscore += 0*memberGenderDetail;
				         }
						
						// 멤버들 중 매칭정보 청소정도
						String memberListClean = matchingInfo.getMat_clean();

						// 멤버의 청소정도
						String memberClean = vo.getMat_clean();

						// 멤버의 청소 중요도
						int memberCleanDetail = vo.getMat_cleanDetail();

						if (memberClean.equals(memberListClean)) {
							totalscore += 1 * memberCleanDetail;
						} else {
							totalscore += 0 * memberCleanDetail;
						}

						
						// 멤버들 중 매칭정보 성격
						String memberListPerson = matchingInfo.getMat_person();

						// 멤버의 성격
						String memberPerson = vo.getMat_person();

						// 멤버의 성격 중요도
						int memberPersonDetail = vo.getMat_personDetail();

						if (memberPerson.equals(memberListPerson)) {
							totalscore += 1 * memberPersonDetail;
						} else {
							totalscore += 0 * memberPersonDetail;
						}

						//멤버들 중 매칭정보 지역
						String memberListRegion = matchingInfo.getMat_region();
						
						//멤버의 지역
						String memberRegion = vo.getMat_region();
						
						//멤버의 지역 중요도
						int memberRegionDetail = vo.getMat_regionDetail();
						
						
						if(memberRegion.equals(memberListRegion)) {
							totalscore += 1*memberRegionDetail;
						}
						else {
							totalscore += 0*memberRegionDetail;
						}
						
						// 총점 출력
//						System.out.println(totalscore);

						// 리스트에 회원들의 총점 넣기
//						int[] scoreList = new int[i];
		//
//						scoreList[i] = totalscore;
		//
//						Arrays.sort(scoreList);
//						
//						System.out.println(scoreList[i+1]);
						
						
						scoreList.put(matchingListUserId,totalscore);
					}
				}
				
				
				Iterator<Map.Entry<String, Integer>> entries = scoreList.entrySet().iterator();
				while (entries.hasNext()) {
					Entry<String, Integer> entry = (Entry<String, Integer>)entries.next();
					System.out.println("아이디:"+entry.getKey()+",총합"+entry.getValue());
					
				}
				
				System.out.println("--------내림차순--------");
				
				List<String> keySetList = new ArrayList<>(scoreList.keySet());
		        // 내림차순 //
		        Collections.sort(keySetList, new Comparator<String>() {
		            @Override
		            public int compare(String o1, String o2) {
		                return scoreList.get(o2).compareTo(scoreList.get(o1));
		            }
		        });
		         
		        for(String key : keySetList) {
		            System.out.println(String.format("아이디 : %s, 총점 : %s", key, scoreList.get(key)));
		        }
		        
		        String [] idList = new String[3];
		        
		        for (int i = 0; i < 3; i++) {
					idList[i] = keySetList.get(i);
				}
		        for (int i = 0; i < idList.length; i++) {
					
				}
		        
		        MatchingVO bestMember1 = service.matchingRead(idList[0]);
				model.addAttribute("bestMember1", bestMember1);
				MatchingVO bestMember2 = service.matchingRead(idList[1]);
				model.addAttribute("bestMember2", bestMember2);
				MatchingVO bestMember3 = service.matchingRead(idList[2]);
				model.addAttribute("bestMember3", bestMember3);
				
				//카톡아이디 찾기
				String member1Kakao =service.searchKakao(bestMember1.getUserId());
				model.addAttribute("member1Kakao",member1Kakao);
				String member2Kakao =service.searchKakao(bestMember2.getUserId());
				model.addAttribute("member2Kakao",member2Kakao);
				String member3Kakao =service.searchKakao(bestMember3.getUserId());
				model.addAttribute("member3Kakao",member3Kakao);
	}
	
	
	// 매칭정보 삭제 GET
	@RequestMapping(value = "/matchingDelete", method = RequestMethod.GET)
	public void getDelete(HttpSession session, Model model, MatchingVO vo, String userId) throws Exception {
		logger.info("getMatching delete");
	}
	
	// 매칭정보 삭제 POST
	@RequestMapping(value = "/matchingDelete", method = RequestMethod.POST)
	public String postMatchingDelete(HttpSession session, Model model) throws Exception {
		logger.info("postMatching delete");

		String userId = (String) session.getAttribute("userId");

		service.matchingDelete(userId);

		return "redirect:/matching/matchingRegist";
	}
	
	// 매칭정보 수정 GET
	@RequestMapping(value = "/matchingModify", method = RequestMethod.GET)
	public void getModify(MatchingVO vo,Model model) throws Exception {
		logger.info("getMatching modify");
		model.addAttribute("matchingvo",vo);
	}

	 //매칭정보 수정 POST
	 @RequestMapping(value = "/matchingModify", method = RequestMethod.POST)
	 public String postModify(MatchingVO vo, Model model) throws Exception{
		 logger.info("getMatching modify");
	
		 service.matchingModify(vo);
		 
		 return "redirect:/matching/matchingRead";
	 }
	
}