package com.bjh.withus.vo;

import lombok.Data;

@Data
public class Todo {
	private int todoNo;
	private String id;
	private String todoDate;
	private String todoContent;
	private String createDate;
	private String updateDate;
}
