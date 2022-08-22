<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
</head>
<body>
<h1>로그인</h1>
<form method="post" action="/login">
<div>
	아이디 : 
	<input type="text" name="id">
</div>
<div>
	패스워드 :
	<input type="password" name ="pw">
</div>
<div>
	<button type="submit">로그인</button>
</div>
</form>
</body>
</html>