package org.project.mapper;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getProductList();
	public int insertProduct(ProductVO vo);
	public ProductVO readProduct(int p_num);
	public CartVO readProductForCart(int p_num);
	public List<OptionVO> readOptionWithPNum(int num);
	public int deleteProduct(int num);
	public int updateProduct(ProductVO vo);
	public List<ProductVO> getListRandom();
	public List<ProductVO> getListRandomFirst(String p_ctg1);
	public List<ProductVO> getListRandomSecond(ProductVO vo);
}