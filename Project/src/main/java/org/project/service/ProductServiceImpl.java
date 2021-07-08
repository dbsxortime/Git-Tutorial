package org.project.service;

import java.util.List;

import org.project.mapper.ProductMapper;
import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getProductList() {
		log.info("getting Product list... ");
		return mapper.getProductList();
	}

	@Override
	public boolean insertProduct(ProductVO vo) {
		log.info("insert Product... : "+vo );
		return mapper.insertProduct(vo)==1;
	}

	@Override
	public ProductVO readProduct(int num) {
		log.info("read Product... num : "+num);
		return mapper.readProduct(num);
	}
	
	@Override
	public CartVO readProductForCart(int num) {
		log.info("read Product... num : "+num);
		return mapper.readProductForCart(num);
	}

	@Override
	public List<OptionVO> readOptionWithPNum(int num) {
		log.info("read Product... num : "+num);
		return mapper.readOptionWithPNum(num);
	}

	@Override
	public boolean deleteProduct(int num) {
		log.info("delete Product list... num : "+num);
		return mapper.deleteProduct(num)==1;
	}
	
	@Override
	public boolean updateProduct(ProductVO vo) {
		log.info("update Product list... : "+vo);
		return mapper.updateProduct(vo)==1;
	}

	@Override
	public List<ProductVO> getListRandom() {
		log.info("get random list ... ");
		return mapper.getListRandom();
	}

	@Override
	public List<ProductVO> getListRandomFirst(String p_ctg1) {
		log.info("get random list (first category)... ");
		return mapper.getListRandomFirst(p_ctg1);
	}

	@Override
	public List<ProductVO> getListRandomSecond(ProductVO vo) {
		log.info("get random list (second category)... ");
		return mapper.getListRandomSecond(vo);
	}
	
}
