<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="${path}/js/board.js"></script>
<script type="text/javascript" lang="javascript"></script>
<script src="http://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<link rel="stylesheet" href="${path}/cs/scheduleAdd.css">
<link rel="stylesheet" href="${path}/cs/calendar.css">
<link rel="stylesheet" href="${path}/cs/calendarForm.css">
</head>
<body>

<form name="calendarForm" id="calendarForm" action="" method="GET">
<input type="hidden" name="year" value="${today_info.search_year }"/>
<input type="hidden" name="month" value="${today_info.search_month-1 }"/>

	<div class="calendar">
		<!-- 날짜 네비게이션 -->
		<div class="navigation">
			<a class="before_after_year" href="/calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
				&lt;&lt; <!-- 이전해 -->
			</a>
			<a class="begore_after_month" href="/calendar?year=${today_info.before_year}&month=${today_info.before_month}">
				&lt; <!-- 이전달 -->
			</a>
			<span class="this_month">
				&nbsp;${today_info.search_year}
				<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
			</span>
			<a class="before_after_month" href="/calendar?year=${today_info.after_year}&month=${today_info.after_month}">
				<!-- 다음달 --> &gt;
			</a>
			<a class="before_after_year" href="/calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
				<!-- 다음해 --> &gt;&gt;
			</a>
		</div>
		<div class="today_button_div">
			<button type="button" class="buttonstyle" onclick="javascript:location.href='/calendar'" style="height: 30px; width: 80px;">Today</button>
			<button type="button" class="buttonstyle board_move openMask_board_move pointer" style="height: 30px; width: 130px;">Add Schedule</button>
		</div>
		<table class="calendar_body">
			<thead>
				<tr bgcolor="#A0D9E2">
					<td class="day sun">Sun</td>
					<td class="day">Mon</td>
					<td class="day">Tue</td>
					<td class="day">Wed</td>
					<td class="day">Thu</td>
					<td class="day">Fri</td>
					<td class="day sat">Sat</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<c:if test="${date_status.index%7==0 }">
									<tr>
								</c:if>
								<td class="today">
									<div class="date">
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">
							</c:when>
							<c:when test="${date_status.index%7==0}">
							</tr>
							<tr>
								<td class="sun_day">
									<div class="sun">
									</c:when>
									<c:otherwise>
										<td class="normal_day">
											<div class="date">
									</c:otherwise>
									</c:choose>
									${dateList.date }
									</div>
									<div>
									<!-- 달력에 일정 띄우고 클릭 시 수정/삭제 창 띄우는 코드 -->
									<c:forEach var="scheduleList" items="${dateList.schedule_data_arr }" varStatus="schedule_data_arr_status">
										<a href="/schedule_show?schedule_idx=${scheduleList.schedule_idx }" onclick="window.open(this.href, '_blank', 'width=550,height=600,left=680%,top200%, toolbars=no, scrollbars=no'); return false;" class="date_subject " style="color: ${scheduleList.schedule_mycolor}">${scheduleList.schedule_subject}</a>
										<br>
									</c:forEach>
								</div>
							</td>
					</c:forEach>
			</tbody>
		</table>
</form>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<div id="mask_board_move"></div>
	<div class="normal_move_board_modal">
		<script>
		$(function() {
			$("#testDatepicker")
						.datepicker(
								{
									dateFormat : "yy-mm-dd",
									changeYear : true,
									changeMonth : true,
									dayNames : ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
									dayNamesMin : ['일', '월', '활', '수', '목', '금', '토'],
									monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
									showMonthAfterYear : true,
									autosize: false,
									showAnim: "slideDown"						
								});
		});
			

		function scheduleAdd() {
			var schedule_add_form = document.schedule_add;
			if (schedule_add_form.schedule_date.value == "" || schedule_add_form.schedule_date.value == null) {
				alert("날짜를 입력해주세요.");
				schedule_add_form.schedule_date.focus();
				return false;
			} else if (schedule_add_form.schedule_subject.value == "" || schedule_add_form.schedule_subject.value == null) {
				alert("제목을 입력해주세요");
				schedule_add_form.schedule_date.focus();
				return false;
			}
			schedule_add_form.submit();
		}
		</script>
		<div class="top" style="">
			<div class="close">x</div>
			<div class="subject">Add Schedule</div>
		</div>
		
		<div class="bottom">
			<div class="info">
				* 순번은 해당 날짜안에서 순서대로 입력이 됩니다.(하루에 최대 4개의 스케줄만 등록할 수 있습니다.)
			</div>
			<form name="schedule_add" action="schedule_add">
				<input type="hidden" name="year" value="${today_info.search_year}"/>
				<input type="hidden" name="month" value="${today_info.search_month-1}"/>
				<div class="contents">
					<ul>
						<li>
							<div class="text_subject">순번 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_num" class="text_type1" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1" id="testDatepicker" readonly="readonly" />
							</div>
						</li>
						<li>
							<div class="text_subject">제목 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_subject" class="text_type1" />
							</div>
						</li>
						<li style="margin-bottom: 70px;">
							<div class="text_subject">내용 :</div>
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="5"></textarea>
							</div>
						</li>
						
						<li>
							<div class="text_subject">공유 :</div>
							<input class="radio" type="radio" name="schedule_share" value="1" checked="checked">공개
							<input type="radio" name="schedule_share" value="2">비공개
						</li>
						
						<li>
							<div class="text_subject">색상 :</div>
							<input class="colorbox" type="color" name="schedule_mycolor" value=""/>
						</li>
						
						<li class="button_li">
							<button type="button" class="buttonstyle board_move_go pointer" onclick="scheduleAdd();">Add</button>
						</li>
						
					</ul>
			</div>
		</form>
	</div>
</div>
</body>
</html>