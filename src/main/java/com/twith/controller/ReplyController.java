package com.twith.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.twith.domain.Criteria;
import com.twith.domain.ReplyDTO;
import com.twith.domain.ReplyPageDTO;
import com.twith.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/*")
@Log4j
//RestController : JSON형태로 객체 데이터를 반환하기 위한 Controller
@RestController
public class ReplyController {
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	//ResponseEntity : 서버의 상태코드, 응답 메세지 등을 담을 수 있는 타입
	//@RequestBody : JSON 데이터를 해석해서 ReplyDTO 타입으로 변환하도록 지정한다.
	//consumes와 produces를 통해서 JSON 방식의 데이터만 처리하도록 한다.
	@PostMapping(value="/regist", consumes="application/json",produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> regist(@RequestBody ReplyDTO reply){
		log.info("ReplyDTO : "+reply);
		
		//DB처리
		boolean result = service.regist(reply);
		return result? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//댓글 전체 목록
	// /pages/2323/2
	@GetMapping(value="/pages/{boardnum}/{page}",
		produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE	
		}
	)
												//Path에 포함되어 있는 boardnum, page 데이터 추출해서 매개변수에 넣기
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("boardnum") Long boardnum,@PathVariable("page") int page) {
		log.info("------getList(reply)------");
		log.info("boardnum : "+boardnum+ " / page : "+page);
		//댓글 또한 페이지번호와, 한 페이지에 띄울 개수 가 필요하므로 게시글리스트 페이징 처리 때 이용한 Criteria를 재사용한다.
		Criteria cri = new Criteria(page, 5);
		//								ReplyPageDTO타입의 객체
		return new ResponseEntity<>(service.getList(cri,boardnum),HttpStatus.OK);
	}
}















