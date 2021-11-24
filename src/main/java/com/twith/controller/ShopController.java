package com.twith.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.twith.domain.Criteria;
import com.twith.domain.PageDTO;
import com.twith.domain.ShopDTO;
import com.twith.domain.UserDTO;
import com.twith.service.ShopReplyService;
import com.twith.service.ShopService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
public class ShopController {
	@Setter(onMethod_ = @Autowired)
	private ShopService service;
	@Setter(onMethod_ = @Autowired)
	private ShopReplyService rservice;
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		log.info("------list-------");
		//DB 검색
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(service.getTotal(cri), cri));
	}
	
	//regist를 위한 View단으로 이동하는 요청
	@GetMapping("/regist")
	public void regist(@ModelAttribute("cri")Criteria cri,Model model, HttpServletRequest request) {
		//@ModelAttribute : model.addAttribute("cri",cri);
	}
	@PostMapping("/regist")
	public String regist(ShopDTO shop,RedirectAttributes ra, HttpServletRequest request) {
		shop.setUserId(((UserDTO)request.getSession().getAttribute("user")).getUserId());
		service.regist(shop);
		//새롭게 등록한 게시글의 번호를 같이 전달하기 위해서는
		//Model 대신 RedirectAttributes를 사용한다.
		ra.addFlashAttribute("result", shop.getShopNum());
		
		//redirect: 접두어를 사용하면 스프링 MVC가 자동으로 redirect로 처리해준다.
		return "redirect:/shop/list";
	}
	//아래의 메소드는 /get 이나 /modify인 경우에 호출되게 되는데
	//그 때 호출하는 uri대로 view를 찾을것이다.
	//즉 /get으로 요청해서 호출됐다면 get.jsp를, /modify로 요청해서 호출됐다면 modify.jsp를 찾게된다.
	@GetMapping({"/get","/modify"})
	public void get(Long shopNum, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("------/get or /modify------");
		model.addAttribute("shop",service.get(shopNum));
	}
	
	@PostMapping("/modify")
	public String modify(ShopDTO shop, Criteria cri, RedirectAttributes ra) {
		log.info("------/modify------");
		if(service.modify(shop)) {
			ra.addFlashAttribute("modify",shop.getShopNum());
		}
		
		return "redirect:/shop/list"+cri.getListLink();
	}
	
	
	@PostMapping("/remove")
	public String remove(Long shopNum, Criteria cri, RedirectAttributes ra) {
		log.info("------/remove------"+shopNum);
			if(service.remove(shopNum)) {
				ra.addFlashAttribute("shopNum",shopNum);
				if(rservice.deleteAll(shopNum));
				
			}
		return "redirect:/shop/list"+cri.getListLink();
	}
}













