<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/cs/scheduleShow.css"/>
<title>Withus</title>
</head>
<body>
	<div class="normal_manage_board_modal">
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
					alert("제목을 입력해주세요.");
					schedule_add_form.schedule_subject.focus();
					return false;
				}
				schedule_add_form.submit();
			}
		</script>
		<script type="text/javascript">
			if(${schedule_show.schedule_share}=="1")
				document.getElementById("first_radio").checked = true;
			else
				document.getElementById("second_radio").checked = true;
		</script>
		
		<div class="top">
			<div class="subject">Schedule</div>
		</div>
		
		<div class="bottom">
			<div class="info">* 변경 혹은 삭제된 일정은 복구할 수 없습니다.</div>
			
			<form role="form" name="schedule_modify">
				<input type="hidden" name="year" value="${today_info.search_year }"></input>
				
				<input type="hidden" name="month" value="${today_into.search_month-1 }"></input>
				<div class="contents">
					<ul>
						<input type="hidden" name="schedule_idx" class="text_type1" value="${schedule_show.schedule_idx }"/>
						<li>
							<div class="text_subject">순번:</div>
							<div class="text_desc">
								<input type="text" name="schedule_num" class="text_type1" value="${schedule_show.schedule_num }"/>
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div>
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1" id="testDatepicker" readonly="readonly" value="${schedule_show.schedule_date }"/>
							</div>
						</li>
						<li>
							<div class="text_subject">제목 :</div>
							<div class="text_desc">
								<textarea name="schedule_subject" class="textarea_type1" rows="1" style="resize: none;">
									${schedule_show.schedule_subject}
									<%--<input type="text" name="schedule_subject" class="text_type1" value="${schedule_show.schedule_subject}"> --%>
								</textarea>
							</div>
						</li>
						<li style="margin-bottom: 75px;">
							<div class="text_subject">내용 :</div>
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="5">
									${schedule_show.schedule_desc}
								</textarea>
							</div>
						</li>
						<li>
							<div class="text_subject">공유 :</div>
							<input class="radio" type="radio" name="schedule_share" id="first_radio" value="1" checked="checked"/>공개
							<input class="radio" type="radio" name="schedule_share" id="second_radio" value="2"/>비공개
						</li>
						<li>
							<div class="text_subject">색상 :</div>
							<input class="colorbox" type="color" name="schedule_mycolor" value="${schedule_show.schedule_mycolor}"/> 
						</li>
						<li class="button_li">
							<div class="managebutton">
								<button type="submit" data-oper="modify" class="buttonstyle board_manage_go pointer">Modify</button>
								<button type="submit" data-oper="delete" class="buttonstyle2 board_manage go pointer">Delete</button>
							</div>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
<script>
	$(document).ready(function(){
		
		var formObj = $('form');
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation == 'delete') {
				formObj.attr("action", "/delete");
			} else if(operation == 'modify') {
				formObj.attr("action", "/modify");
			}
			formObj.submit();
		});
	});
</script>
</body>
</html>