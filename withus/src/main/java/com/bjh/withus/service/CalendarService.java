package com.bjh.withus.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjh.withus.mapper.TodoMapper;
import com.bjh.withus.vo.Todo;

@Service
@Transactional
public class CalendarService {
	@Autowired
	TodoMapper todoMapper;
	
	public Map<String, Object> getTargetCalendar(String currentYear, String currentMonth, String option){
	// 1. 달력 소스 코드
	Map<String, Object> map = new HashMap<>();
	// 오늘 날짜를 보여주기 위해(오늘 날짜의 년도와 월을 가진다)
	Calendar c = Calendar.getInstance();
	
	if(currentYear != null && currentMonth != null) { //매개변수 값이 들어오면
		int y = 0;
		int m = 0;
		y = Integer.parseInt(currentYear); // 숫자로 재정의
		// 알고리즘 구현에서는 1월 ~ 12월
		m = Integer.parseInt(currentMonth); // 숫자로 재정의
		if(option != null && option.equals("pre")) {
			m = m - 1; // m값이 0이 될 때 이슈발생
			if(m == 0) { // 이슈해결
				m = 12;
				y = y - 1; // y--, y-=1
			}
		} else if(option != null && option.equals("next")) {
			m = m +1; // m값이 13이 될 때 이슈 발생
			if(m == 13) { //이슈 해결
				m = 1;
				y = y + 1; // y++, y+=1
			}
		}
		c.set(Calendar.YEAR, y); // 매개변수의 값인 년도로 바꾸어준다
		c.set(Calendar.MONDAY, m-1); // 매개변수의 값이 월로 바꾸어준다
	}
	
	c.set(Calendar.DATE, 1); // c 객체가 오늘의 정보인데 같은 달 1일로 변경
	
	// 달력에 필요한 데이터 모델
	int targetYear = c.get(Calendar.YEAR); // 오늘 년도
	int targetMonth = c.get(Calendar.MONTH) + 1; // 오늘 월
	int endDay = c.getActualMaximum(Calendar.DATE); // 오늘 월의 마지막 일자
	
	// 달력 앞, 뒤 공백의 개수
	int startBlank = 0;
	startBlank = c.get(Calendar.DAY_OF_WEEK) -1;
	int endBlank = 0;
	endBlank = 7 - (startBlank + endDay) % 7;
	if(endBlank == 7) {
		endBlank = 0;
	}
	
	map.put("targetYear", targetYear);
	map.put("targetMonth", targetMonth);
	map.put("endDay", endDay);
	map.put("startBlank", startBlank);
	map.put("endBlank", endBlank);
	
	// 2. 달력에 추가할 모델 알고리즘 코드
	List<Todo> todoList = null;
	Todo todo = new Todo();
	
	String strYear ="" + targetYear;
	String strMonth ="" + targetMonth;
	if(targetMonth < 10) { // targetMonth가 10보다 작으면
		strMonth = "0" + targetMonth;
	}
	todo.setTodoDate(strYear+"-"+strMonth);
	
	todoList = todoMapper.selectTodoListByMonth(todo);
	
	map.put("todoList", todoList);
	
	return map;
	}
}
