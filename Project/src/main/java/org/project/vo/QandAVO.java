package org.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QandAVO {
	private int q_bno;
	private String u_id;
	private String q_title;
	private String q_content;
	private Date q_regdate;
	private int issecret;
	
	private String keyword;
	private String answer;

}