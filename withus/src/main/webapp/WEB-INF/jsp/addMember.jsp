<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="/addMember">
		<div>
			아이디 : 
			<input type="text" name="id">
		</div>
		<div>
			비밀번호 : 
			<input type="password" name="pw">
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>