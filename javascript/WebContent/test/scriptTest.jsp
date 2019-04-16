<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTest.jsp</title>
<style>
	img { width: 200px;}
</style>
<script>
	function mouseoutHandler(){
		document.getElementById("img1").src="./lmages/Lighthouse.jpg";
	}
	function mouseoverHandler(){
		document.getElementById("img1").src="./lmages/Hydrangeas.jpg";
	}
</script>
</head>
<body>
<!-- id값을 유일함 -->
<img id="img1" src = "./lmages/Desert.jpg" 
onmouseover="mouseoverHandler()"
onmouseout="mouseoutHandler();">
</body>
</html>