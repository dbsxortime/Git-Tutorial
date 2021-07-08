package org.project.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.ProductVO;
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
public class SearchServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private SearchService service;
	
//	@Test
//	public void testList() {
//		List<ProductVO> list = service.search("홍길동");
//		for (ProductVO vo : list) {
//			log.info(vo);
//		}
//	}
	
//	@Test
//	public void testAllList() {
//		List<TransactionVO> list = service.getAllOrderList();
//		for (TransactionVO vo : list) {
//			log.info(vo);
//		}
//	}
	
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
//			service.insertOrderList(vo);
//		}
//	}
	
}
