package org.project.service;

import java.util.List;

import org.project.mapper.CouponMapper;
import org.project.mapper.MyPageMapper;
import org.project.mapper.UserMapper;
import org.project.vo.CartVO;
import org.project.vo.CouponVO;
import org.project.vo.MyPageVO;
import org.project.vo.OrderVO;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mMapper;
	@Setter(onMethod_ = @Autowired)
	private UserMapper uMapper;

	@Override
	public List<MyPageVO> getPayedMyPageLists(String u_id) {
		log.info("get payed mypage lists... id : "+u_id);
		return mMapper.getPayedMyPageLists(u_id);
	}

	@Override
	public OrderVO getListsOrderPopUp(int o_num) {
		log.info("get mypage order popup ...order... o_num : "+o_num);
		return mMapper.getListsOrderPopUp(o_num);
	}

	@Override
	public List<CartVO> getPNameLists(int o_num) {
		log.info("get mypage order popup ...products... o_num : "+o_num);
		return mMapper.getPNameLists(o_num);
	}

	@Override
	public List<CouponVO> getCouponKeys() {
		return mMapper.getCouponKeys();
	}

	@Override
	public UserVO readUserForUpdate(String u_id) {
		return uMapper.readUserForUpdate(u_id);
	}

	@Override
	public void MyPageUpdateUser(UserVO vo) {
		uMapper.MyPageUpdateUser(vo);
	}

	@Override
	public void MyPageUpdateUserNoPw(UserVO vo) {
		uMapper.MyPageUpdateUserNoPw(vo);
	}

	@Override
	public void deleteUser(String u_id) {
		uMapper.deleteUser(u_id);
		uMapper.deleteCartWithId(u_id);
		uMapper.deleteOrderWithId(u_id);
		uMapper.deleteCouponUserWithId(u_id);
		uMapper.deleteQandAWithId(u_id);
	}

	@Override
	public List<CouponVO> getMyCoupon(String u_id) {
		return mMapper.getMyCoupon(u_id);
	}

	
	
}
