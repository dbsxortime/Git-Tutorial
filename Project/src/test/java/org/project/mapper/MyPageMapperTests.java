package org.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.NoticeVO;
import org.project.vo.TransactionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MyPageMapperTests {
	
	@Autowired
	private MyPageMapper mapper;
	
//	@Test
//	public void testList() {
//		List<MypageVO> list = mapper.getOrderList("홍길동");
//		for (MypageVO vo : list) {
//			log.info(vo);
//		}
//	}
	
	/*
	 * @Test public void testAllList() { List<TransactionVO> list =
	 * mapper.getAllOrderList(); for (TransactionVO vo : list) { log.info(vo); } }
	 */
	
//	@Test
//	public void testInput() {
//		TransactionVO vo = new TransactionVO();
//		for(int i=0;i<99;i++) {
//			if(i<30) {
//				vo.setU_id("홍길동");
//			}else if(i<60) {
//				vo.setU_id("강감찬");
//			}else {
//				vo.setU_id("대조영");
//			}
//			vo.setO_num(1000+i);
//			vo.setP_name("testProduct"+i);
//			vo.setP_num(2000+i);
//			vo.setTotal_price(10000+(i*330));
//			mapper.insertOrderList(vo);
//		}
//	}

}
