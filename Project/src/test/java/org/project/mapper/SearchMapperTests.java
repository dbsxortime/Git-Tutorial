package org.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.ProductVO;
import org.project.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SearchMapperTests {
	
	@Autowired
	private SearchMapper mapper;
	
//	@Test
//	public void testSearch() {
//		List<ProductVO> list = mapper.search("바");
//		for (ProductVO vo : list) {
//			log.info(vo);
//		}
//	}
	
	
//	@Test
//	public void testsearchbyPrice() {
//		SearchVO vo = new SearchVO();
//		vo.setKeyword("바");
//		vo.setPrice1(20000);
//		vo.setPrice2(30000);
//		
//		List<ProductVO> list = mapper.searchWithPrice(vo);
//		log.info("search by price1: " + vo.getPrice1());
//		log.info("search by price2: " + vo.getPrice2());
//		
//				
//	}
}
