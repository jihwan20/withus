<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WithUs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<form class="container-fluid">
		<%@ include file="./header.jsp"%>
		<div class="slider" style="text-align: center;">
			<div>
				<img style="display: inline;" src="images/1.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/6.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/10.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/14.jpg" alt="" width="23%" height="500">
				
			</div>
			<div>
				<img style="display: inline;" src="images/2.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/7.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/11.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/15.jpg" alt="" width="23%" height="500">
			</div>
			<div>
				<img style="display: inline;" src="images/3.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/8.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/12.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/16.jpg" alt="" width="23%" height="500">
			</div>
			<div>
				<img style="display: inline;" src="images/4.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/9.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/13.jpg" alt="" width="23%" height="500">&nbsp;
				<img style="display: inline;" src="images/17.jpg" alt="" width="23%" height="500">
			</div>
		</div>
	</form>
	<script>
	$(document).ready(function(){
	  $('.slider').bxSlider();
	});
	</script>
</body>
</html>