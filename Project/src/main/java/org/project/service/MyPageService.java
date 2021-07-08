package org.project.service;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.CouponVO;
import org.project.vo.MyPageVO;
import org.project.vo.OrderVO;
import org.project.vo.UserVO;

public interface MyPageService {
	public List<MyPageVO> getPayedMyPageLists(String u_id);
	public OrderVO getListsOrderPopUp(int o_num);
	public List<CartVO> getPNameLists(int o_num);
	public List<CouponVO> getCouponKeys();
	
	public List<CouponVO> getMyCoupon(String u_id);
	
	public UserVO readUserForUpdate(String u_id);
	public void MyPageUpdateUser(UserVO vo);
	public void MyPageUpdateUserNoPw(UserVO vo);
	public void deleteUser(String u_id);
}