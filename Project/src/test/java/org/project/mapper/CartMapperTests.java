package org.project.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {
	
	@Autowired
	private CartMapper mapper;
	
	@Test
	public void testList() {
		List<CartVO> vo = mapper.getCartById("qtime01");
		log.info(vo);
	}

}
