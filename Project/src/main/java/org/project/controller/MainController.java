package org.project.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.project.service.ProductService;
import org.project.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/shoppingmall/*")
public class MainController {
   private MethodClass mc = new MethodClass();
   
   @Autowired
   private ProductService pService;
   
   @GetMapping("homepage")
   public void goHomePage(Model model, Principal principal) {
      log.info("go homepage...");
      String u_id=mc.checkUser(principal);
      model.addAttribute("u_id",u_id);
      
      model.addAttribute("list",pService.getListRandom());
   }

   @GetMapping("/first_category/first_category")
   public void goFirst(Model model, Principal principal, ProductVO vo) {
      log.info("go first-category... keyword " + vo);
      String u_id=mc.checkUser(principal);
      model.addAttribute("u_id",u_id);
      
      model.addAttribute("list",pService.getListRandomFirst(vo.getP_ctg1()));
   }
   
   @GetMapping("/second_category/second_category")
   public void goSecond(Model model, Principal principal, ProductVO vo) {
      log.info("go second-category...");
      String u_id=mc.checkUser(principal);
      model.addAttribute("u_id",u_id);
      
      model.addAttribute("list",pService.getListRandomSecond(vo));
   }
   
   
}