package org.project.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {
	
	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testList() {
		UserVO vo = mapper.read("user01");
		log.info(vo);
	}

}
