package org.project.mapper;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.CouponVO;
import org.project.vo.MyPageVO;
import org.project.vo.OrderVO;

public interface MyPageMapper {
	public List<MyPageVO> getPayedMyPageLists(String u_id);
	public OrderVO getListsOrderPopUp(int o_num);
	public List<CartVO> getPNameLists(int o_num);
	public List<CouponVO> getCouponKeys();
	public List<CouponVO> getMyCoupon(String u_id);
}
