package org.project.security;

import org.project.vo.UserVO;
import org.project.mapper.UserMapper;
import org.project.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String u_id) throws UsernameNotFoundException {
		log.warn("load user by user id : " + u_id);
		UserVO vo = mapper.read(u_id);
		log.warn("user mapper : " + vo);
		return vo == null ? null : new CustomUser(vo);
	}
	
}