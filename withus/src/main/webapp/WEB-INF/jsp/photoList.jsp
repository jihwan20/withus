<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table{
		margin: auto;
		text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>withus</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/521b75b25a.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-fluid">
	<!-- modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-xl">
			<form method="post" action="/addphoto" enctype="multipart/form-data">
				<div class="modal-content">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사진업로드</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<!-- Modal body -->
					<div class="modal-body">
						사진 이름 : <input type="text" name="photoName">
						이미지 : <input type="file" multiple="multiple" name="photoFileUpload" required="required">
					</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="upload" type="submit" class="btn btn-outline-primary">Upload</button>
					<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
				</div>
				
				</div>
			</form>
		</div>
	</div>
	<%@ include file="./header.jsp"%>
		<div>
			<div style="text-align: right; color: blue;">
				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">
					업로드
				</button>
			</div>
			<table class="table">
			
				<tr>
				<%
					int v = 0;
				%>
				<c:forEach items="${photoList}" var="p">
					<td>
						<div>
							<img src="/images/${p.getPhotoFile().getPhotoFileName() }.${p.getPhotoFile().getPhotoFileType() }" width="400" height="350">
						</div>
						<div>
							${p.getPhotoName() }
						</div>
					</td>
				<%
				v+=1; // for문 끝날때마다 i는 1씩 증가
				if(v%3==0) {
					%>
								</tr><tr>
					<%
				}
				%>
				</c:forEach>
				</tr>
			</table>
		</div>
		<br>
		<div class="text-center">
			<c:if test="${startPage > 1}">
				<a href="${pageContext.request.contextPath}/photoList?currentPage=${startPage-1}">
					<i class="fa-solid fa-square-caret-left fa-lg"></i>
				</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${lastPage}" var="i">
				<c:choose>
					<c:when test="${i == currentPage }">
						<a href="${pageContext.request.contextPath}/photoList?currentPage=${i}" class="btn btn-primary">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}photoList?currentPage=${i}" class="btn btn-outline-primary text-blue">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPage != totalPage}">
				<a href="${pageContext.request.contextPath}/photoList?currentPage=${lastPage+1}">
					<i class="fa-solid fa-square-caret-right fa-lg"></i>
				</a>
			</c:if>
		</div>
	</div>
<script>
function confirm_event() {
	if(confirm("업로드하시겠습니까?")){
		alert("업로드 완료");
		document.form.submit;
	} else {
		alert("업로드 취소");
	}
	
}
</script>
</body>
</html>
