<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>screen.jsp</title>
<style>
body{
font-size:10px;
}

div{
font-size: 1.5em;
border : 1px solid red;
width : 32%;
height : 100px;
display: inline-block;
}
@media screen and (max-width: 1000px) {
	div{ width: 49%;}
}

@media screen and (max-width: 500px) {
	div{ width: 99%;}
	nav{ display:none;}
}

@media screen and (min-width: 500px) {
  body {
    background-color: lightgreen;
  }
}
</style>
</head>
<nav>메뉴바</nav>
<body>
<div>A</div><div>B</div><div>C</div><div>D</div><div>E</div><div>F</div><div>G</div>
<script>
	//모니터의 크기
	document.write("<br> 모니터 : " + screen.width + " * " + screen.height); 
	//
	document.write("<br> window : " + window.innerWidth + " * " + window.innerHeight); 
</script>
</body>
</html>