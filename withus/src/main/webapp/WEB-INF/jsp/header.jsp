<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#logo{
	color:blue;
	font-size: 25px;
}
</style>
<title>WithUs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item"><a id="logo" class="navbar-brand" href="/main">WithUs</a></li>
				<li class="nav-item"><a class="nav-link" href="/Calendar">Calendar</a></li>
				<li class="nav-item"><a class="nav-link" href="/photoList">Photo</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link 3</a></li>
			</ul>
		<c:if test="${ loginMember == null }">
			<div>
				<a href="/login">로그인</a>
				<a href="/addMember">회원가입</a>
			</div>
		</c:if>
		<c:if test="${ loginMember != null }">
			<div>
				${loginMember.id}님 환영합니다.
				<a href="/logout">로그아웃</a>
			</div>
		</c:if>
		</div>
	</nav>
</body>
</html>