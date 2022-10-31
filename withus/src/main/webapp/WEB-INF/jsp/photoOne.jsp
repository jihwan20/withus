<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<div class=".container-fluid">
	<!-- modal -->
	<div class="modal" id="editPhoto">
		<div class="modal-dialog modal-xl">
			<form method="post" action="/updatePhoto" enctype="multipart/form-data">
				<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">edit</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<!-- Modal body -->
					<div class="modal-body">
					<c:forEach items="${photo}" var="p">
						<input type="hidden" name="photoNo" value="${p.photoNo }">
						사진 이름 : <input type="text" name="photoName" value="${p.photoName }">
						이미지 : <input type="file" multiple="multiple" name="photoFileUpload" required="required" onchange="readURL(this)">
						<hr>
						<div style="text-align: center;" >
							<img id="preview" width="500" height="400"/>
						</div>
					</c:forEach>
					</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="edit" type="submit" class="btn btn-outline-primary">edit</button>
					<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
				</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="./header.jsp"%>
		<form id="oneForm" method="post" action="/deletePhoto">
			<div>
				 <input type="hidden" id="photoNo" value="${photoNo}">
			</div>
			<div style="text-align: center;">
				<c:forEach items="${photo}" var="p">
					<img src="${pageContext.request.contextPath}/images/${p.pf.photoFileName}.${p.pf.photoFileType}" width="400" height="350">
					<div>
						${p.photoName }
					</div>
				</c:forEach>
			</div>
			<div style="text-align: right; margin-right: 1%;">
				<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/photoList">목록</a>
				<a data-bs-toggle="modal" data-bs-target="#editPhoto" class="btn btn-outline-primary">edit</a>
				<button id="deleteBtn" type="submit" class="btn btn-outline-primary">삭제</button>
			</div>
		</form>
	</div>
</body>
<script>
$(document).ready(function() {
	$("#deleteBtn").click(function(){
	var answer = confirm("정말로 삭제하겠습니까?");
		if(answer){
			var form = $("#oneForm").parents('form');
			form.submit();
			alert("삭제하였습니다.")
		} else {
			
		}
	});
});
</script>
</html>