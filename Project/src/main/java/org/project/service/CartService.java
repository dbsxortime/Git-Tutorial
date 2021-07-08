package org.project.service;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.TransactionVO;

public interface CartService {
	public List<CartVO> getCartById(String u_id);
	public int isCartRepeated(CartVO vo);
	public void insertCart(CartVO vo);
	public void insertOption(CartVO vo);
	public void deleteCart(int c_num);
	public void deleteAllCart(String u_id);
	public int getAllPriceById(String u_id);
	public int getAllSaveById(String u_id);
	public List<TransactionVO> getCartListByCNum(int c_num);
	public void CartUpdater(CartVO vo);
	public void updateAmount(CartVO vo);
	public int getPnum(int c_num);
}
