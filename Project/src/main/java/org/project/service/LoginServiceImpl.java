package org.project.service;

import org.project.mapper.UserMapper;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LoginServiceImpl implements LoginService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public boolean regUser(UserVO vo) {
		log.info("reg-ing User... : "+vo );
		return mapper.regUser(vo)==1 && mapper.regAuth(vo)==1;
	}

	@Override
	public int checkU_Id(String u_id) {
		return mapper.checkU_Id(u_id);
	}

	@Override
	public int checkU_pid(String u_pid) {
		return mapper.checkU_pid(u_pid);
	}

	@Override
	public int checkU_phone(String u_phone) {
		return mapper.checkU_phone(u_phone);
	}

	@Override
	public int checkU_email(String u_email) {
		return mapper.checkU_email(u_email);
	}

	@Override
	public UserVO findId(UserVO vo) {
		return mapper.findId(vo);
	}
	@Override
	public UserVO findPw(UserVO vo) {
		return mapper.findPw(vo);
	}

	@Override
	public void updatePw(UserVO vo) {
           mapper.updatePw(vo);		
	}
	
	
	

	

}