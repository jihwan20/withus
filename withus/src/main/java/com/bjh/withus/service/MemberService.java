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
	
	public Member getSelectOne(Member member) {
		return memberMapper.selectMemberOne(member);
	}
}
