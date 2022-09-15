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
<script src="https://kit.fontawesome.com/521b75b25a.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<form class="container-fluid">
	<%@ include file="./header.jsp"%>
		<div>
			<table class="table">
			
				<tr>
				<%
					int v = 0;
				%>
				<c:forEach items="${photoList}" var="p">
					<td>
						<div>
							<img src="/images/${p.getPhotoImg() }" width="180" height="180">
						</div>
					</td>
				<%
				v+=1; // for문 끝날때마다 i는 1씩 증가
				if(v%5==0) {
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
	</form>
</body>
</html>