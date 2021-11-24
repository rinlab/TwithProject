package com.twith.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.twith.domain.Criteria;
import com.twith.domain.ReplyDTO;
import com.twith.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//SpringRunner는 SpringJUnit4ClassRunner의 자식 클래스이며
//4.3버전 이상부터 사용 가능한 확장판이다.
@RunWith(SpringRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	private Long[] arBoardnum = { 2323L,2322L,2309L,2308L,2307L };
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
//	@Test
//	public void mapperTest() {
//		log.info(mapper);
//	}
	
//	@Test
//	public void insertTest() {
//		for(int i=0;i<10;i++) {
//			ReplyDTO reply = new ReplyDTO();
//			reply.setBoardnum(arBoardnum[i%5]);
//			reply.setReplywriter("durian");
//			reply.setReplycontents("댓글 테스트 "+(i+1));
//			mapper.insert(reply);
//		}
//	}
	
//	@Test
//	public void getTotalTest() {
//		log.info(mapper.getTotal(2323L));
//	}
	
	@Test
	public void getListWithPagingTest() {
		Long boardnum = 2323L;
		Criteria cri = new Criteria(1, 5);
		log.info("-----------------------------");
		List<ReplyDTO> replies = mapper.getListWithPaging(cri, boardnum);
		log.info(replies.size());
		replies.forEach(reply->{
			log.info(reply);
		});
	}
}

























