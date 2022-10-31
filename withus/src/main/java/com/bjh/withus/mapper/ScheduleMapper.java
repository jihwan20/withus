package com.bjh.withus.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.DateData;
import com.bjh.withus.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	public int scheduleAdd(Schedule schedule);
	
	public int before_schedule_add_search(Schedule schedule);
	
	public ArrayList<Schedule> scheduleList(DateData dateData);
	
	public Schedule get (int idx);
	
	public int update(Schedule schedule);
	
	public int delete(Schedule schedule);
}