package org.project.service;

import org.project.vo.CouponVO;

public interface CouponService {
	public CouponVO checkKeys(String key);
	public void insertCoupon(CouponVO vo);
	public CouponVO checkCoupon(CouponVO vo);
	public void updateUsedCoupon(CouponVO vo);
}
