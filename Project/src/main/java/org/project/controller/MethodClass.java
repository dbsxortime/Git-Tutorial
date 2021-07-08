package org.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.project.vo.CouponVO;

public class MethodClass {
	public String checkUser(Principal principal) {
		String u_id;
		if(principal!=null) {
			u_id = principal.getName();
		}else {
			u_id="비회원";
		}
		return u_id;
	}
	
	public int calcDelieveryFee(int price) {
		if(price>=50000) {
			return 0;
		}else {
			return 2500;
		}
	}
	
	public int calcSave(int TotalPrice) {
		return TotalPrice/100*1;
	}
	
	
}
