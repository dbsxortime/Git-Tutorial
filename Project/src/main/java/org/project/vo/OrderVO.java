package org.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int inputNum;
	private int o_num;
	private String u_id;
	private String o_name;
	private String o_email;
	private String o_phone;
	
	private String d_name;
	private String d_phone;
	private String d_addr;
	private String o_msg;
	
	private int o_pay;
	private int delievery_fee;
	private int final_price;
	private int discount;
	
	private String o_option;
	private String delievery_status;
	
	//========================
	private Date o_date;
	private String o_addr;
	private int total_save;
	
	// 쿠폰, 적립금 사용관련
	private int saved;
	private int couponed_num;
	
	//구매 수량
	private int p_num;
	private int op_quantity;
	private String op_size;
	
}