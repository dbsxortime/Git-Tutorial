package org.project.vo;

import lombok.Data;

@Data
public class PaymentVO {
	private int o_num;
	private String p_name;
	private int p_price;
	private int total_price;
}
