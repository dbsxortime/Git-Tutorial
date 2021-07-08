package org.project.vo;

import lombok.Data;

@Data
public class TransactionVO {
	private int o_num;

	private int total_price;
	private int delivery_fee;
	private int discount;
	private int final_price;
	
	private String delievery_status;

	private String d_name;
	private int d_phone;
	private String d_addr;
	private String o_msg;
	
}
