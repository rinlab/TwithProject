package com.twith.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.twith.domain.Criteria;
import com.twith.domain.UserDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserServiceTests {
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
		@Test
	public void checkId() throws Exception {
		UserDTO user = new UserDTO();
		String userId = "apple";
		log.info(service.checkId(userId));
	}
}
