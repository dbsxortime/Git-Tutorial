package org.project.service;

import org.project.vo.UserVO;

public interface LoginService {
   public boolean regUser(UserVO vo);
   
   //reg check
   public int checkU_Id(String u_id);
   public int checkU_pid(String u_pid);
   public int checkU_phone(String u_phone);
   public int checkU_email(String u_email);
   
   //find id,pw
   public UserVO findId(UserVO vo);
   public UserVO findPw(UserVO vo);
   
   public void updatePw(UserVO vo);
   
   
}