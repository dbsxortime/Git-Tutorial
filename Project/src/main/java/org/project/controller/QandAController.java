package org.project.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.project.service.QandAService;
import org.project.vo.QandAVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/shoppingmall/QandA/*")
public class QandAController {
	@Autowired
	private QandAService service;
	
	
	@GetMapping("list")
	public void getQandAList(Model model, Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		
		log.info("get QandA List ...");
		model.addAttribute("list", service.getQandAList());
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register(Model model,Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		log.info("get QandA register ...");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String registerQandA(RedirectAttributes rttr, QandAVO vo) {
		log.info("get QandA register...");
		log.info(vo.getIssecret());
		
		service.insertQandA(vo);
		
		return "redirect:/shoppingmall/QandA/list";
	}
	
	
	@GetMapping("get")
	public void getQandA(Model model, @RequestParam("q_bno") int q_bno, Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		
		log.info("get QandA...");
		model.addAttribute("QandA", service.readQandA(q_bno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("modify")
	public void modifyQandA(Model model, @RequestParam("q_bno") int q_bno, Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		log.info("modify QandA...");
		model.addAttribute("QandA", service.readQandA(q_bno));
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("modify")
	public String modifyQandA(RedirectAttributes rttr, QandAVO vo) {
		log.info("modify QandA...");
		service.updateQandA(vo);
		return "redirect:/shoppingmall/QandA/list";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("remove")
	public String removeQandA(RedirectAttributes rttr, @RequestParam("q_bno") int q_bno) {
		log.info("remove QandA...");
		service.deleteQandA(q_bno);
		return "redirect:/shoppingmall/QandA/list";
	}
	//=================================================my QnA
	@PreAuthorize("isAuthenticated()")
	@GetMapping("listWithUser")
	public String getQandAListWithID(Model model, Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		log.info("get QandA List With id...");
		model.addAttribute("list", service.getQandAListWithID(u_id));
		
		return "/shoppingmall/mypage/myQ&A";
	}
	
	@GetMapping("goback")
	public String myFunction(HttpServletRequest request,
            RedirectAttributes rttr){
		
			String referer = request.getHeader("Referer");
			return "redirect:"+ referer;
	}
	
	//=================================================my QnA
	@Secured({"ROLE_ADMIN"})
	@PostMapping("Answer")
	public String answer(Model model, 
			@RequestParam String answer,
			@RequestParam int q_bno
			) {
		QandAVO vo = new QandAVO();
		vo.setAnswer(answer);
		vo.setQ_bno(q_bno);
		
		log.info("no :" + q_bno + " answer : " + answer);
		service.answer(vo);
		return "success";
	}
}