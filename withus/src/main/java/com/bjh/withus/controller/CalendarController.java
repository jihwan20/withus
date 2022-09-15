package com.bjh.withus.controller;

import java.io.IOException;


import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bjh.withus.service.CalendarService;

@Controller
public class CalendarController {
	@Autowired
	CalendarService calendarService;
	
	@GetMapping("/Calendar")
	public String Calendar(HttpServletRequest request) throws ServletException, IOException {
		String currentYear = request.getParameter("currentYear");
		String currentMonth = request.getParameter("currentMonth");
		String option = request.getParameter("option");
		
		Map<String, Object> map = calendarService.getTargetCalendar(currentYear, currentMonth, option);
		
		//모델
		request.setAttribute("targetYear", map.get("targetYear"));
		request.setAttribute("targetMonth", map.get("targetMonth"));
		request.setAttribute("endDay", map.get("endDay"));
		// 달력을 출력할 때 앞/뒤 필요한 공백 <td>
		request.setAttribute("startBlank", map.get("startBlank"));
		request.setAttribute("endBlank", map.get("endBlank"));
		// 달력에 출력한 todo 모델 목록
		request.setAttribute("todoList", map.get("todoList"));
		
		return "calendar";
	}
}
 