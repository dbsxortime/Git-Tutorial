package org.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.QandAVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QandAMapperTests {
	
	@Autowired
	private QandAMapper mapper;
	
	@Test	// 전체 리스트 불러오기
	public void testList() {
		List<QandAVO> list = mapper.getQandAList();
		for(QandAVO vo : list) {
			log.info(vo);
		}
	}
	
//	@Test	// 하나 정해시 읽기
//	public void testRead() {
//		log.info(mapper.readQandA(62));
//	}
//	
//	@Test	// 삭제
//	public void testDelete() {
//		log.info(mapper.deleteQandA(99));
//	}
//	
//	@Test	// 수정 (오류 발생 수정 필요)
//	public void testUpdate() {
//		QandAVO vo = new QandAVO();
//		vo.setQ_title("this is new title");
//		vo.setQ_content("this is new content");
//		vo.setQ_bno(98L);
//		mapper.insertQandA(vo);
//		log.info(mapper.updateQandA(vo));
//	}
	
}