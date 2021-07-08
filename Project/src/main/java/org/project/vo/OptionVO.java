package org.project.vo;

import lombok.Data;

@Data
public class OptionVO {
	private int op_idx;
	private int p_num;
	private String op_quantity;
	private String op_size;
	private String calcQuantity;
	private String calcSize;
}
