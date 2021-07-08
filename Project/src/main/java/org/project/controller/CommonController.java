package org.project.controller;

import org.project.service.LoginService;
import org.project.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/login/*")
public class CommonController {
   @Setter(onMethod_ = @Autowired)
   private PasswordEncoder pwEncoder;
   
   @Autowired
   private LoginService service;
   
   @GetMapping("/accessError")
   public void accessDenied(Authentication auth, Model model) {
      log.info("access Denied : " + auth);
      model.addAttribute("msg", "Access Denied");
   }
   
   @GetMapping("/customLogin")
   public void loginInput(String error, String logout, Model model) {
      log.info("error : " + error);
      log.info("logout : " + logout);
      
      if(error != null) {
         model.addAttribute("error", "다시 시도해주세요.");
      }
      
      if(logout != null) {
         model.addAttribute("logout", "로그아웃이 완료 되었습니다.");
      }
      
   }
   
   @GetMapping("/customLogout")
   public String logoutGET() {
      log.info("custom logout");
      return "/shoppingmall/homepage";
   }
   
   @GetMapping("register")
   public void goRegister() {
      log.info("go Register Page... ");
   }
   
   @PostMapping("doRegister")
   public String registerUser(RedirectAttributes rttr, UserVO vo) {
      log.info("reg user... : " + vo);
      vo.setU_pw(pwEncoder.encode(vo.getU_pw()));
      vo.setAuth("ROLE_USER");
      
      
      String pid1 = vo.getU_pid().split("-")[0];
      String pid2 = vo.getU_pid().split("-")[1];
      vo.setPid1(pid1);
      vo.setPid2(pid2);
      
      
      
      rttr.addFlashAttribute("user",service.regUser(vo));
      return "redirect:/shoppingmall/homepage";
   }
   
   
   //reg check
   
   @GetMapping("/checkU_id")
   @ResponseBody
   public String checkU_id(RedirectAttributes rttr,
         @RequestParam String u_id) {
      log.info("check id .. id : " + u_id);
      return Integer.toString(service.checkU_Id(u_id));
   }
   
  
   
   @GetMapping("/checkU_pid")
   @ResponseBody
   public String checkU_pid(RedirectAttributes rttr,
         @RequestParam String u_pid) {
      log.info("check pid .. pid : " + u_pid);
      return Integer.toString(service.checkU_pid(u_pid));
   }
   
   @GetMapping("/checkU_phone")
   @ResponseBody
   public String checkU_phone(RedirectAttributes rttr,
         @RequestParam String u_phone) {
      log.info("check phone .. phone : " + u_phone);
      return Integer.toString(service.checkU_phone(u_phone));
   }
   
   @GetMapping("/checkU_email")
   @ResponseBody
   public String checkU_email(RedirectAttributes rttr,
         @RequestParam String u_email) {
      log.info("check email .. email : " + u_email);
      return Integer.toString(service.checkU_email(u_email));
   }
   
   @GetMapping("/findId")
	public void findId() {
	   log.info("go page find id");
	}
   
   @PostMapping("/findId")
	public String findIdAction( UserVO vo, Model model) {
		UserVO user = service.findId(vo);
		log.info(vo);
		log.info(user);
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getU_id());
		}
		
		return "/login/findId";
	}
   
   @GetMapping("/findPassword")
	public void findPassword() {
	   log.info("go page find pw");
	}
   
   
   @PostMapping("/findPassword")
	public String findPasswordAction(RedirectAttributes rttr, UserVO vo, Model model) {
		UserVO user = service.findPw(vo);
		
		log.info(vo);
		log.info(user);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getU_id());
		}
		
		return "login/findPassword";
	}
   
   
   @PostMapping("/updatePassword")
	public String updatePasswordAction(RedirectAttributes rttr, UserVO vo) {
       
	    log.info("updatePassword");
	    
	   String updatePw = pwEncoder.encode(vo.getUpdatePw());
		vo.setUpdatePw(updatePw);
		log.info(vo);
		service.updatePw(vo);
		return "login/customLogin";
	}
	
   // 비밀번호 바꾸기할 경우 성공 페이지 이동
	/*
	 * @RequestMapping(value="check_password_view") public String
	 * checkPasswordForModify(HttpSession session, Model model) { UserVO loginUser =
	 * (UserVO) session.getAttribute("loginUser");
	 * 
	 * if(loginUser == null) { return "member/login"; } else { return
	 * "mypage/checkformodify"; } }
	 */
   
   
   
   
   
   
}