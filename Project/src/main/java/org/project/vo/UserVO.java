package org.project.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_pid;
	private String u_addr;
	private String u_email;
	private Date reg_date;
	private String u_phone;
	private int save;
	private String pid1;
	private String pid2;
	// 추가 내용
	private List<AuthVO> authList;
	private String auth;
	
	private String updatePw;
}
