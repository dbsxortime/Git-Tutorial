package org.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeMapperTests {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void testList() {
		List<NoticeVO> list = mapper.getNoticeList();
		for (NoticeVO vo : list) {
			log.info(vo);
		}
	}
	
//	@Test public void testInsert() {
//		NoticeVO vo = new NoticeVO();
//		for(int i=0;i<100;i++) {
//			vo.setN_title("공지제목"+i);
//			vo.setN_context("내용"+i); 
//			vo.setAdmin_id("project");
//			mapper.insertNotice(vo);
//		}
//	}
	 
	
//	@Test
//	public void testRead() {
//		log.info(mapper.readNotice(62L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info(mapper.deleteNotice(99L));
//	}
	
//	@Test
//	public void testUpdate() {
//		NoticeVO vo = new NoticeVO();
//		vo.setN_title("this is new title");
//		vo.setN_context("this is new context"); 
//		vo.setN_num(98L);
//		mapper.insertNotice(vo);
//		log.info(mapper.updateNotice(vo));
//	}

}
