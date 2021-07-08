package org.project.service;


import java.util.List;

import org.project.mapper.OrderMapper;
import org.project.vo.CartVO;
import org.project.vo.OptionVO;
import org.project.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;


	@Override
	public void insertOrder(OrderVO vo) {
		log.info("insert order ...");
		mapper.insertOrder(vo);
	}


	@Override
	public void oNumToCart(OrderVO oVO) {
		log.info("insert o_num to tbl_cart ...");
		mapper.oNumToCart(oVO);
	}

	@Override
	public void numToCart(String u_id) {
		log.info("insert 1 to tbl_cart ...");
		mapper.numToCart(u_id);
	}

	@Override
	public void updateSave(OrderVO vo) {
		log.info("insert o_num to tbl_cart ...");
		mapper.updateSave(vo);
	}


	@Override
	public int getONum() {
		return mapper.getONum();
	}


	@Override
	public List<CartVO> getLastestCart(String u_id) {
		return mapper.getLastestCart(u_id);
	}


	@Override
	public OrderVO getLastestOrder(String u_id) {
		return mapper.getLastestOrder(u_id);
	}


	@Override
	public void updateQuantity(OrderVO vo) {
		mapper.updateQuantity(vo);
	}



	
}
