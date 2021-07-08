package org.project.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int r_bno;
	private int r_score;
	
	private String u_id;
	private String r_title;
	private String r_content;
	private String p_image;
	private String p_name;
	
}