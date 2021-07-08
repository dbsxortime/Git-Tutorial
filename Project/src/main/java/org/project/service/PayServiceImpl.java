package org.project.service;


import org.project.mapper.UserMapper;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PayServiceImpl implements PayService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public UserVO readUserForOrder(String u_id) {
		log.info("get user for order... id : " + u_id);
		UserVO vo = mapper.readUserForOrder(u_id);
		return vo;
	}

	
}
