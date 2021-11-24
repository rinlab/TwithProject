package com.twith.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.twith.domain.Criteria;
import com.twith.domain.ReplyDTO;
import com.twith.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyServiceTests {
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
//	@Test
//	public void serviceTest() {
//		log.info(service);
//	}
	
//	@Test
//	public void registTest() {
//		ReplyDTO reply = new ReplyDTO();
//		reply.setBoardnum(2323L);
//		reply.setReplywriter("durian");
//		reply.setReplycontents("댓글 테스트 11");
//		log.info(service.regist(reply));
//	}
	
	@Test
	public void getListTest() {
		Criteria cri = new Criteria(1, 5);
		Long boardnum = 2323L;
		log.info(service.getList(cri, boardnum));
	}
}























