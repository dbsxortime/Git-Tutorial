package org.project.service;

import org.project.mapper.CouponMapper;
import org.project.vo.CouponVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CouponServiceImpl implements CouponService {
	
	@Setter(onMethod_ = @Autowired)
	private CouponMapper mapper;

	@Override
	public CouponVO checkKeys(String key) {
		log.info("check key ... key : " + key);
		return mapper.checkKeys(key);
	}

	@Override
	public void insertCoupon(CouponVO vo) {
		log.info("insert coupon : vo" + vo);
		mapper.insertCoupon(vo);
	}

	@Override
	public CouponVO checkCoupon(CouponVO vo) {
		return mapper.checkCoupon(vo);
	}

	@Override
	public void updateUsedCoupon(CouponVO vo) {
		log.info("update coupon : vo" + vo);
		mapper.updateUsedCoupon(vo);
	}
	
}