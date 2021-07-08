package org.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	private int c_num;	//seq
	private String u_id;
	
	//productVO
	private int p_num;
	private String p_name;
	private int p_price;
	private String p_image;
	private String p_ctg1;
	private String p_ctg2;
	
	//coupon
	private int discount;
	//coupon > calc
	private int total_price;
	
	//option
	private int c_quantity;
	private String c_size;
	
	private int save;
	private int ispay;
	
	//checker
	private int checkerP_num;
	private int checkerC_quantity;
	private int checkerC_num;
	
	//amount update
	private int changeamount;
	private String changeoption;
	
}