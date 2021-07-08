package org.project.mapper;

import org.project.vo.UserVO;

public interface UserMapper {
   public UserVO read(String u_id);
   public int regUser(UserVO vo);
   public int regAuth(UserVO vo);
   public UserVO readUserForOrder(String u_id);
   public UserVO readUserForUpdate(String u_id);
   
   //update user
   public void MyPageUpdateUser(UserVO vo);      //when pw inserted
   public void MyPageUpdateUserNoPw(UserVO vo);   //when pw not inserted
   
   //delete user
   public void deleteUser(String u_id);
   public void deleteCartWithId(String u_id);
   public void deleteOrderWithId(String u_id);
   public void deleteCouponUserWithId(String u_id);
   public void deleteQandAWithId(String u_id);
   
   //reg check
   public int checkU_Id(String u_id);
   public int checkU_pid(String u_pid);
   public int checkU_phone(String u_phone);
   public int checkU_email(String u_email);
   
   //find id,pw / update pw
   public UserVO findId(UserVO vo);
   public UserVO findPw(UserVO vo);
   
   public void updatePw(UserVO vo);
   
   
}