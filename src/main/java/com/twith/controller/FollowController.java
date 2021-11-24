package com.twith.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twith.domain.Criteria;
import com.twith.domain.FollowDTO;
import com.twith.domain.PageDTO;
import com.twith.domain.UserDTO;
import com.twith.service.FollowService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/follow/*")
@Log4j
public class FollowController {

	@Setter(onMethod_ = @Autowired)
	private FollowService service;
 
//	@RequestMapping("/main")
//	public void main() {
//		//log.info("basic.......");
//		log.info("followMain.......");
//	}
	
	@GetMapping("/following")
	public void main(Model model, HttpServletRequest request, Criteria cri) {
		log.info("------following-------");
		// 세션에 userId를 받아오기 위해 Criteria의 userId 적용 후 아래 코드를 통해 세션 적용
		cri.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId());
		//DB 검색
		model.addAttribute("list",service.getFollowingList(cri));
		model.addAttribute("pageMaker",new PageDTO(service.getFollowingTotal(cri), cri));
	}
	
	@RequestMapping("/follower")
	public void followerList(Model model, HttpServletRequest request, Criteria cri) {
		log.info("------followerList-------");
		cri.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId());
		//DB 검색
		model.addAttribute("list",service.getFollowerList(cri));
		model.addAttribute("pageMaker",new PageDTO(service.getFollowerTotal(cri), cri));
	}
	
	@GetMapping("/remove")
	public String remove(Model model, HttpServletRequest request, FollowDTO follow, RedirectAttributes ra, Criteria cri) {
		log.info("------/remove------");
		
		if(service.remove(follow)) {
			ra.addFlashAttribute("list",service.getFollowingList(cri));
		}
		
		return "redirect:/follow/following";
	}
	
	@GetMapping("/removeFollower")
	public String removeFollower(Model model, HttpServletRequest request, FollowDTO follow, RedirectAttributes ra, Criteria cri) {
		log.info("------/removeFollower------");
		
		if(service.removeFollower(follow)) {
			ra.addFlashAttribute("list",service.getFollowerList(cri));
		}
		
		return "redirect:/follow/follower";
	}
	
	@GetMapping("/addFollow")
	public String addFollow(Model model, HttpServletRequest request, FollowDTO follow, RedirectAttributes ra, Criteria cri) {
		log.info("------addFollow------");
		log.info("------getFollowId------"+follow.getFollowId());
		log.info("------session------"+((UserDTO)request.getSession().getAttribute("user")).getUserId());
		
		String url = "";
		// follow.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId()); 동건이 작품
		if(!(follow.getFollowId().equals(((UserDTO)request.getSession().getAttribute("user")).getUserId()))) {
			//db에 있는 follow테이블의 기존 데이터 중
			//session의 followId와 팔로우 하려는 followId가
			//중복된 데이터가 없다면 addFollow 서비스 실행하기
			int cnt = service.checkFollowId(follow);
			if(cnt != 1) {
				if(service.addFollow(follow)) {
					ra.addFlashAttribute("list",service.getFollowingList(cri));
					ra.addFlashAttribute("result","팔로우 추가 성공");
					ra.addFlashAttribute("followId",follow.getFollowId());
					url = "redirect:/follow/following";
				}
			}else {
				ra.addFlashAttribute("result","중복 유저 팔로우 추가 불가");
				ra.addFlashAttribute("followId",follow.getFollowId());
				url = "redirect:/follow/search";
			}
		}else {
			ra.addFlashAttribute("result","셀프 팔로우 추가 불가");
			url = "redirect:/follow/search";
		}
		
		return url;
	}
	
	// 유저 아이디 검색
		
	@RequestMapping("/search")
	public void search() {
		log.info("search.......");
	}
	
	@GetMapping("/search")
	public void search(Criteria cri,Model model) {
		log.info("------search-------");
		//DB 검색
		model.addAttribute("list",service.getUserList(cri));
		model.addAttribute("pageMaker",new PageDTO(service.getUserTotal(cri), cri));
	}
}
