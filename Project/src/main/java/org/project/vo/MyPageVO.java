package org.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MyPageVO {
	private Date o_date;
	private String p_name;
	private int total_price;
	private String delievery_status;
	private int o_num;
	private int c_num;
}
