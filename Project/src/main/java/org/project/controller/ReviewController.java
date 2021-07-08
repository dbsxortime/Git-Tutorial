package org.project.controller;

import java.security.Principal;

import org.project.service.ReviewService;
import org.project.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/shoppingmall/review/*")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@GetMapping("review")
	public void getReviewList(Model model,Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		
		log.info("get Review List ... ");
		model.addAttribute("review", service.getReviewList());
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("register")
	public void register(Model model,Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("get Review register ... ");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("register")
	public String registerReview(RedirectAttributes rttr, ReviewVO vo,
			Principal principal) {
		String u_id = principal.getName();
		rttr.addFlashAttribute("u_id",u_id);
		log.info("get Review register...");
		rttr.addFlashAttribute("result", service.insertReview(vo));
		return "redirect:/shoppingmall/review/review";
	}
	
	@GetMapping("get")
	public void getReview(Model model, @RequestParam("r_bno") int r_bno,
			Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		log.info("get Review...");
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("modify")
	public void modifyReview(Model model, @RequestParam("r_bno") int r_bno,
			Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		
		log.info("modify Review...");
		model.addAttribute("review", service.readReview(r_bno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("modify")
	public String modifyReview(RedirectAttributes rttr, ReviewVO vo,
			Principal principal) {
		String u_id = principal.getName();
		rttr.addFlashAttribute("u_id",u_id);
		
		log.info("modify Review...");
		rttr.addFlashAttribute("result", service.updateReview(vo));
		return "redirect:/shoppingmall/review/review";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("remove")
	public String removeReview(RedirectAttributes rttr, @RequestParam("r_bno") int r_bno,
			Principal principal) {
		String u_id = principal.getName();
		rttr.addFlashAttribute("u_id",u_id);
		
		log.info("remove Review...");
		rttr.addFlashAttribute("result", service.deleteReview(r_bno));
		return "redirect:/shoppingmall/review/review";
	}
}
