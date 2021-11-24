package com.twith.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/musteat/*")
public class MusteatController {
//	@Setter(onMethod_ = @Autowired)
//	private MoimService service;
	
	@GetMapping("/make")
	public void make() {
		log.info("--------make--------");
		//DB 검색
	}

}













