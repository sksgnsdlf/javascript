<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mouseEvent.jsp</title>
<style>
div { width: 300px; height: 300px; border : 1px solid red;}
</style>
<script>
	window.onload = function(){
		document.getElementById("div1").addEventListener("click",mouseHandler);
		document.getElementById("div2").addEventListener("click",mouseHandler);
	}
	function mouseHandler(){
		//마우스 좌표값 출력
		console.log(event.clientX + " : " + event.clientY);
		console.log(event.screenX + " : " + event.screenY);
		console.log(event.target.innerHTML)	//이벤트 발생한 대상(태그)
		//event.target == this 같은개념
		console.log("마우스 버튼 : " + event.button)	//event.which
	}
</script>
</head>
<body>
<h3>마우스 이벤트 연습</h3>
<div id="div1">first</div>
<div id="div2">second</div>
</body>
</html>