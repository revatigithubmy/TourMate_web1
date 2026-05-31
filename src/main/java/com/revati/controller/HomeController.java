package com.revati.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/index")
	public String indexPage() {
		return "index"; // loads index.jsp
	}

	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}

	@RequestMapping("/customerRegister")
	public String customerRegister() {
		return "customerRegister";
	}

	@RequestMapping("/customerLogin")
	public String customerLogin() {
		return "customerLogin";
	}

	@RequestMapping("/guideLogin")
	public String showGuideLogin() {
		return "guideLogin"; // This should match your guideLogin.jsp filename
	}

	@RequestMapping("/guideRegister")
	public String guideRegister() {
		return "guideRegister";
	}

}
