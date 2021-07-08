package org.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	
	@Autowired
	private ProductMapper mapper;
	
//	@Test
//	public void testList() {
//		List<ProductVO> list = mapper.getProductList();
//		log.info("getProductLis......");
//	}
	
//	@Test
//	public void testRead() {
//		log.info(mapper.readProduct(1));
//	
//}
	
	  @Test
	  public void testOption() {
		  log.info(mapper.readOptionWithPNum(161));
	  }
	
	
}
