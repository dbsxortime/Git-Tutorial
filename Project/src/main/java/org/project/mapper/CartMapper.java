package org.project.mapper;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.TransactionVO;

public interface CartMapper {
	public List<CartVO> getCartById(String u_id);
	public int insertCart(CartVO vo);
	public int insertOption(CartVO vo);
	public int deleteCart(int c_num);
	public int deleteAllCart(String u_id);
	public int getAllPriceById(String u_id);
	public int getAllSaveById(String u_id);
	public List<TransactionVO> getCartListByCNum(int c_num);
	
	public int checkMypage(CartVO vo);
	public int checkRepeatedCNum(CartVO vo);
	public void updateMyPageWithChecker(CartVO vo);
	public void updateMyPagePriceWithChecker(CartVO vo);
	
	public void updateOption(CartVO vo);
	public int getPnum(int c_num);
}