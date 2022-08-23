<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#Mainform {
		border: 2px solid #1bf;
		border-color : black;
		border-radius : 15px;
		text-align: center;
		padding: 2%;
		margin-top: 15%;
		margin-left: 38%;
		margin-right: 38%;
	}
</style>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<link href="styles/style.css" rel="stylesheet" type="text/css">
<title>WithUs</title>
</head>
<body>
<form method="post" action="/login">
<div id="Mainform">
	<div>
		<a class="h1" style="color: blue; text-decoration: none;" href="/main">WithUs</a>
	</div>
	<br>
	<div>
		<span class="material-symbols-outlined">
			person_filled
			<input style="width: 75%; font-family:initial;" type="text" name="id">
		</span>
		
	</div>
	<div>
		<span class="material-symbols-outlined">
			lock
			<input style="width: 75%; font-family:initial;" type="password" name ="pw">
		</span>
	</div>
	<br>
	<div>
		<button class="btn btn-primary" style="width: 75%; " type="submit">로그인</button>
		
	</div>
</div>
<br>
<div style="text-align:center;">
	<a style="text-decoration: none;" href="/addMember">회원가입</a>
</div>
</form>
</body>
</html>