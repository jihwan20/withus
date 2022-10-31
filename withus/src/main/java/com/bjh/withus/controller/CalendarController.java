package com.bjh.withus.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bjh.withus.mapper.ScheduleMapper;
import com.bjh.withus.vo.DateData;
import com.bjh.withus.vo.Schedule;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CalendarController {

		@Autowired
		public SqlSession sqlSession;
		
		
		private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
		
		@RequestMapping(value = "calendar", method = RequestMethod.GET)
		public String calendar (Model model, HttpServletRequest request, DateData dateData) {
			Calendar calendar = Calendar.getInstance();
			DateData calendarData;
			// 검색날짜
			if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
				dateData = new DateData(String.valueOf(calendar.get(Calendar.YEAR)),String.valueOf(calendar.get(Calendar.MONTH)), String.valueOf(calendar.get(Calendar.DATE)), null, null);
			}
			
			Map<String, Integer> today_info = dateData.today_info(dateData);
			List<DateData> dateList = new ArrayList<DateData>();
			
			// 검색 날짜 end
			ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
			ArrayList<Schedule> ScheduleList = scheduleMapper.scheduleList(dateData);
			
			// 달력데이터에 넣기 위한 배열 추가
			Schedule[][] schedule_data_arr = new Schedule[32][4];
			if (ScheduleList.isEmpty() != true) {
				int j = 0;
				for(int i = 0; i < ScheduleList.size(); i++) {
					int date = Integer.parseInt(String.valueOf(ScheduleList.get(i).getSchedule_date()).substring(String.valueOf(ScheduleList.get(i).getSchedule_date()).length()-2, String.valueOf(ScheduleList.get(i).getSchedule_date()).length()));
					if (i > 0) {
						int date_before = Integer.parseInt(String.valueOf(ScheduleList.get(i - 1).getSchedule_date()).substring(String.valueOf(ScheduleList.get(i - 1).getSchedule_date()).length() - 2, String.valueOf(ScheduleList.get(i - 1).getSchedule_date()).length()));
						if (date_before == date) {
							j = j + 1;
							schedule_data_arr[date][j] = ScheduleList.get(i);
						} else {
							j = 0;
							schedule_data_arr[date][j] = ScheduleList.get(i);
						}
					} else {
						schedule_data_arr[date][j] = ScheduleList.get(i);
					}
				}
			}
			
			// 실질적인 달력 데이터 리스트에 데이터 삽입 시작
			// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
			for (int i = 1; i<today_info.get("start"); i++) {
				calendarData = new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
			
			//날짜 삽입
			for(int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
				Schedule[] schedule_data_arr3 = new Schedule[4];
				schedule_data_arr3 = schedule_data_arr[i];
				
					if(i == today_info.get("today")) {
						calendarData = new DateData(String.valueOf(dateData.getYear()),String.valueOf(dateData.getMonth()),String.valueOf(i), "today", schedule_data_arr3);
					} else {
						calendarData = new DateData(String.valueOf(dateData.getYear()),String.valueOf(dateData.getMonth()),String.valueOf(i), "normal_date", schedule_data_arr3);
					} 
					dateList.add(calendarData);
				}
			
			// 달력 빈 곳 빈 데이터로 삽입
			int index = 7 -dateList.size() % 7;
			
			if(dateList.size() % 7 != 0) {
				
				for (int i = 0; i < index; i++) {
					calendarData = new DateData(null, null, null, null, null);
					dateList.add(calendarData);
				}
			}
			
			//배열에 담음
			model.addAttribute("dateList", dateList);
			model.addAttribute("today_info", today_info);
			return "calendar";
		}
		// 일정 추가
		@RequestMapping(value = "schedule_add", method = RequestMethod.GET)
		public String schedule_add(HttpServletRequest request, Schedule schedule, RedirectAttributes rttr) {
			ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
			int count = scheduleMapper.before_schedule_add_search(schedule);
			String message = "";
			String url = "redirect:calendar";
			
			if(count >= 4) {
				message = "일정은 최대 4개만 등록 가능합니다.";
			} else {
				scheduleMapper.scheduleAdd(schedule);
				message = "일정이 등록되었습니다.";
			}
			rttr.addFlashAttribute("message", message);
			return url;
		}
		
		// 일정 상세보기
		@RequestMapping(value = "/schedule_show", method = RequestMethod.GET)
		public String schedule_show(Model model, HttpServletRequest request, @RequestParam("schedule_idx") int idx, RedirectAttributes rttr) {
			ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
			String url = "redirect:calendar";
			scheduleMapper.get(idx);
			model.addAttribute("schedule_show", scheduleMapper.get(idx));
			return null;
		}
		
		// 일정 수정
		@RequestMapping(value = "modify", method = RequestMethod.GET)
		public String schedule_modify(Model model, HttpServletRequest request, Schedule schedule, RedirectAttributes rttr) {
			ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
			scheduleMapper.update(schedule);
			
			model.addAttribute("schedule_modify", scheduleMapper.update(schedule));
			return "/modify";
		}
		
		// 일정 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String schedule_delete(Model model, HttpServletRequest request, Schedule schedule, RedirectAttributes rttr) {
			ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
			scheduleMapper.delete(schedule);
			
			model.addAttribute("schedule_delete", scheduleMapper.delete(schedule));
			return null;
		}

}