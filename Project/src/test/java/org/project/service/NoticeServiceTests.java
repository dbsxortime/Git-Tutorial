package org.project.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.NoticeVO;
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
public class NoticeServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	@Test
	public void testList() {
		log.info(service.getNoticeList());
	} 
	
//	@Test public void testInsert() {
//	NoticeVO vo = new NoticeVO();
//		vo.setN_title("공지제목"+999);
//		vo.setN_context("내용"+999); 
//		vo.setAdmin_id("project");
//		service.insertNotice(vo);
//	}
	
//	@Test
//	public void testRead() {
//		log.info(service.readNotice(62L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info(service.deleteNotice(999L));
//	}
	
}
