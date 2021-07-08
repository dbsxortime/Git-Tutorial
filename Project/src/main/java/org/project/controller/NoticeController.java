package org.project.controller;

import java.security.Principal;

import org.project.service.NoticeService;
import org.project.vo.NoticeVO;
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
@RequestMapping("/shoppingmall/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	
	@GetMapping("list")
	public void getNoticeList(Model model,Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		log.info("get notice list... ");
		model.addAttribute("list",service.getNoticeList());
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("register")
	public void register(Model model,Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("get notice register... ");
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("register")
	public String registerNotice(RedirectAttributes rttr, NoticeVO vo) {
		log.info("register notice");
		
		rttr.addFlashAttribute("result",service.insertNotice(vo));
		return "redirect:/shoppingmall/notice/list";
	}
	
	@GetMapping("get")
	public void getNotice(Model model, @RequestParam("n_num") int n_num,Principal principal) {
		MethodClass mc = new MethodClass();
		String u_id=mc.checkUser(principal);
		model.addAttribute("u_id",u_id);
		log.info("get notice... ");
		model.addAttribute("notice",service.readNotice(n_num));
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("modify")
	public void modifyNotice(Model model, @RequestParam("n_num") int n_num,
			Principal principal) {
		String u_id = principal.getName();
		model.addAttribute("u_id",u_id);
		log.info("modify notice... ");
		model.addAttribute("notice",service.readNotice(n_num));
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("modify")
	public String modifyNotice(RedirectAttributes rttr, NoticeVO vo) {
		log.info("modify notice... ");
		rttr.addFlashAttribute("result",service.updateNotice(vo));
		return "redirect:/shoppingmall/notice/list";
	}
	
	@Secured({"ROLE_ADMIN"})
	@PostMapping("remove")
	public String removeNotice(RedirectAttributes rttr, @RequestParam("n_num") int n_num) {
		log.info("remove notice... ");
		rttr.addFlashAttribute("result",service.deleteNotice(n_num));
		return "redirect:/shoppingmall/notice/list";
	}
	
}
