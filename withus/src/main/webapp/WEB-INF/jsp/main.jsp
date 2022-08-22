<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
</head>
<body>
<h1>WithUs</h1>
	<ul>
			<li>
				<c:if test="${ loginMember == null }">
					<a href="/login">로그인</a>
					<a href="/addMember">회원가입</a>
				</c:if>
				<c:if test="${ loginMember != null }">
					<div>
						${loginMember.id}님 환영합니다.
					</div>
					<a href="/logout">로그아웃</a>
				</c:if>
			</li>
	</ul>
</body>
</html>