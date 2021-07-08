package org.project.service;

import java.util.List;

import org.project.mapper.CartMapper;
import org.project.vo.CartVO;
import org.project.vo.TransactionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Override
	public int isCartRepeated(CartVO vo) {
		log.info("check cart for insert... vo : " + vo);
		return mapper.checkMypage(vo);
	}

	@Override
	public List<CartVO> getCartById(String u_id) {
		log.info("get cart by id... id : "+u_id);
		return mapper.getCartById(u_id);
	}
	

	@Override
	public void insertCart(CartVO vo) {
		log.info("insert cart... : "+vo );
		mapper.insertCart(vo);
	}

	@Override
	public void insertOption(CartVO vo) {
//		log.info("insert option... : "+vo );
//		return mapper.insertOption(vo)==1;
	}


	@Override
	public void deleteCart(int c_num) {
		log.info("delete cart... c_num : "+ c_num );
		mapper.deleteCart(c_num);
	}


	@Override
	public void deleteAllCart(String u_id) {
		log.info("delete all cart... id : "+ u_id);
		mapper.deleteAllCart(u_id);
	}


	@Override
	public int getAllPriceById(String u_id) {
		log.info("get all price ... id : "+ u_id);	
		return mapper.getAllPriceById(u_id);
	}


	@Override
	public List<TransactionVO> getCartListByCNum(int c_num) {
		log.info("get car list ... num : "+ c_num);	
		return mapper.getCartListByCNum(c_num);
	}


	@Override
	public int getAllSaveById(String u_id) {
		log.info("get all price ... id : "+ u_id);	
		return mapper.getAllSaveById(u_id);
	}

	@Override
	public void CartUpdater(CartVO vo) {
		log.info("Cart update ... vo : "+ vo);	
		
		vo.setC_num(mapper.checkRepeatedCNum(vo));
		mapper.updateMyPageWithChecker(vo);
		mapper.updateMyPagePriceWithChecker(vo);
		
	}

	@Override
	public void updateAmount(CartVO vo) {
		mapper.updateOption(vo);
		mapper.updateMyPagePriceWithChecker(vo);
	}

	@Override
	public int getPnum(int c_num) {
		return mapper.getPnum(c_num);
	}



}