package com.bjh.withus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.Member;

@Mapper

public interface MemberMapper {
	Member selectMemberOne(Member member);
}
