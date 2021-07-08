package org.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int n_num;
	private String n_title;
	private String n_context;
	private String admin_id;
	private Date n_regdate;
	
}
