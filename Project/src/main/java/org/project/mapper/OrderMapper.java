package org.project.mapper;


import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.OrderVO;

public interface OrderMapper {
	public int insertOrder(OrderVO vo);
	public void numToCart(String u_id);
	public void oNumToCart(OrderVO oVO);
	public void updateSave(OrderVO vo);
	public int getONum();
	public List<CartVO> getLastestCart(String u_id);
	public OrderVO getLastestOrder(String u_id);
	public void updateQuantity(OrderVO vo);
}