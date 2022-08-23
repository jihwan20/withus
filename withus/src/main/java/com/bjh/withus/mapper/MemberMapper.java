package com.bjh.withus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.Member;

@Mapper

public interface MemberMapper {
	// 로그인
	Member selectMemberOne(Member member);
	// 회원가입
	void insertMember(Member member);
}
