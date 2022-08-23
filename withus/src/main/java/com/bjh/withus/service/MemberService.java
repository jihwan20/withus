package com.bjh.withus.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjh.withus.mapper.MemberMapper;
import com.bjh.withus.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	// 로그인
	public Member getSelectOne(Member member) {
		return memberMapper.selectMemberOne(member);
	}
	
	// 회원가입
	public void getaddMember(Member member) {
		String Id = member.getId();
		String Pw = member.getPw();
		
		member.setId(Id);
		member.setPw(Pw);
		
		memberMapper.insertMember(member);
		
	}
}
