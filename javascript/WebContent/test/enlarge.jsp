<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enlarge.jsp</title>
<script>
function enlarge(){
	var fs = document.getElementById("demo").style.fontSize //10px
	document.getElementById("demo").style.fontSize = (parseInt(fs) +10) +"px";
}										//parseInt로 px빼고 10만들고 +10 +px하면 20px
</script>
</head>
<body>
<H4>글자 크게</H4>
<button type="button" onclick="enlarge()">크게</button>
<p id="demo" style="font-size:10px;">hello! </p>
</body>
</html>