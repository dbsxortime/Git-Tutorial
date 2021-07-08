package org.project.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.MyPageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MyPageServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	/*
	 * @Test public void testSearch() { List<MyPageVO> list =
	 * service.getMyPageList("바"); for (MyPageVO vo : list) { log.info(vo); } }
	 */
	
}
