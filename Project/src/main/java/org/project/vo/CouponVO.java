package org.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {
	private String u_id;
	private int cp_num;
	private String cp_name;
	private String cp_key;
	private int cp_possible;
	private int cp_discount;
	private Date cp_regdate;
	private int cp_expire;
	
	private int cpu_num;
	private int isused;
	private Date cpu_expire;
	
	private int o_num;
}
