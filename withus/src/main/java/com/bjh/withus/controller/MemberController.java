package com.bjh.withus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bjh.withus.mapper.MemberMapper;
import com.bjh.withus.service.MemberService;
import com.bjh.withus.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	// 로그인 이동
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	// 로그인 액션
	@PostMapping("/login")
	public String login(HttpSession session, Member member) {
		Member loginMember = memberService.getSelectOne(member);
		if(loginMember == null) {
			// 로그인 실패시 로그인 창으로 다시 돌아가기
			return "redirect:/login";
		}
		// 로그인 성공 session에 정보 저장후 메인페이지로 이동
		session.setAttribute("loginMember", loginMember);
		return "redirect:/main";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	//회원가입 이동
	@GetMapping("/addMember")
	public String addMember() {
		return "addMember";
	}
	
	// 회원가입 액션
	@PostMapping("/addMember")
	public String addMember(Member member) {
		System.out.println(member);
		memberService.getaddMember(member);
		//회원가입 성공시 로그인창으로 이동
		return "redirect:/login";
	}
}
