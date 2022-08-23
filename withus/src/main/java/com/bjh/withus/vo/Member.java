package com.bjh.withus.vo;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class Member {
	private int memberNo;
	private String id;
	private String pw;
	private String createDate;
	private String updateDate;
}
