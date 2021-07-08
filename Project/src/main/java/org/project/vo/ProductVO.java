package org.project.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int p_num;
	private String p_name;
	private int p_price;
	private String p_content;
	private String p_image;
	private String sell_yn;
	private String p_ctg1;
	private String p_ctg2;
	private int p_hit;
	private int save;
	private String p_cont_img;
}
