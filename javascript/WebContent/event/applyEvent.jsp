<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applyEvent.jspe</title>
</head>
<body>
<script src="../js/button.js"></script>
<script>
	window.onload = function(){
		new Button("span1");
		new Button("a1");
		new Button("div1");
	}
</script>
</body>
<h3>apply, call 함수 연습</h3>
<span id="span1"> 스팬</span><br>
<a href="#" id="a1">링크</a>
<div id="div1">디비젼</div>
</html>