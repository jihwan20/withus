package com.bjh.withus.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Schedule {
	
	int schedule_idx;
	int schedule_num;
	String schedule_subject;
	String schedule_desc;
	Date schedule_date;
	
	String schedule_share;
	String schedule_mycolor;
	
	public int getSchedule_idx() {
		return schedule_idx;
	}
	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}
	
	public void setSchedule_mycolor(String schedule_mycolor) {
		this.schedule_mycolor = schedule_mycolor;
	}
	
}
