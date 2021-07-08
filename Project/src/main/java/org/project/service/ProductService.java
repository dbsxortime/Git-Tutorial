package org.project.service;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> getProductList();
	public boolean insertProduct(ProductVO vo);
	public ProductVO readProduct(int num);
	public CartVO readProductForCart(int num);
	public List<OptionVO> readOptionWithPNum(int num);
	public boolean deleteProduct(int num);
	public boolean updateProduct(ProductVO vo);
	public List<ProductVO> getListRandom();
	public List<ProductVO> getListRandomFirst(String p_ctg1);
	public List<ProductVO> getListRandomSecond(ProductVO vo);
}
