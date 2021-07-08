package org.project.mapper;

import org.project.vo.CouponVO;

public interface CouponMapper {
	public CouponVO checkKeys(String cp_key);
	public void insertCoupon(CouponVO vo);
	public CouponVO checkCoupon(CouponVO vo);
	public void updateUsedCoupon(CouponVO vo);
}