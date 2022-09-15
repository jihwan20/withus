package com.bjh.withus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MainController {
	
	@GetMapping({"/","/main"})
	public String index() {
		return "main";
	}
	// 로그인 이동
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	// 앨범 이동
	@GetMapping("/photo")
	public String photo() {
		return "photoList";
	}
}
