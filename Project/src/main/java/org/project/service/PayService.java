package org.project.service;

import org.project.vo.UserVO;

public interface PayService {
	public UserVO readUserForOrder(String u_id);
}