package com.twith.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.twith.domain.Criteria;
import com.twith.domain.ShopReplyDTO;
import com.twith.domain.ShopReplyPageDTO;
import com.twith.service.ShopReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/sreply/*")
@Log4j
//RestController : JSON형태로 객체 데이터를 반환하기 위한 Controller
@RestController
public class ShopReplyController {
	@Setter(onMethod_ = @Autowired)
	private ShopReplyService service;
	
	//ResponseEntity : 서버의 상태코드, 응답 메세지 등을 담을 수 있는 타입
	//@RequestBody : JSON 데이터를 해석해서 ReplyDTO 타입으로 변환하도록 지정한다.
	//consumes와 produces를 통해서 JSON 방식의 데이터만 처리하도록 한다.
	@ResponseBody
	@PostMapping(value="/regist", consumes=MediaType.APPLICATION_JSON_UTF8_VALUE, produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> regist(@RequestBody ShopReplyDTO sreply){
		log.info("ShopReplyDTO : "+sreply);
		
		//DB처리
		boolean result = service.regist(sreply);
		return result? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//댓글 전체 목록
	// /pages/2323/2
	@GetMapping(value="/pages/{shopNum}/{page}",
		produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE	
		}
	)
												//Path에 포함되어 있는 boardnum, page 데이터 추출해서 매개변수에 넣기
	public ResponseEntity<ShopReplyPageDTO> getList(@PathVariable("shopNum") Long shopNum,@PathVariable("page") int page) {
		log.info("------getList(shop_reply)------");
		log.info("shopNum : "+shopNum+ " / page : "+page);
		//댓글 또한 페이지번호와, 한 페이지에 띄울 개수 가 필요하므로 게시글리스트 페이징 처리 때 이용한 Criteria를 재사용한다.
		Criteria cri = new Criteria(page, 5);
		//								ReplyPageDTO타입의 객체
		return new ResponseEntity<>(service.getList(cri,shopNum),HttpStatus.OK);
	}
	
//	@DeleteMapping : REST 방식 이용시 삭제 요청을 보낼 때 사용
	@DeleteMapping(value="/{SReplyNum}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("SReplyNum") Long SReplyNum){
		log.info("REMOVE : "+SReplyNum);
		return service.remove(SReplyNum)? new ResponseEntity<>("success",HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//	/reply/11
	//댓글수정
	//PUT
	//	모든 데이터들을 다 전달해야 함 ,자원의 전체 수정, 자원 내 모든 필드를 전달해야 함, 	전달되지 않은 필드는 모두 초기화 처리가 된다.
	//PATCH
	//	자원의 일부 수정, 수정할 필드만 전송
	//PUT, PATCH 둘 다 사용 가능
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value="/{SReplyNum}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ShopReplyDTO sreply){
		log.info("MODIFY : "+sreply.getSreplyNum());
		if(service.modify(sreply)) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/{SReplyNum}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ShopReplyDTO> get(@PathVariable("SReplyNum")Long SReplyNum){
		log.info("GET : "+SReplyNum);
		return new ResponseEntity<>(service.get(SReplyNum),HttpStatus.OK);
	}
}















