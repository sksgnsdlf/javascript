<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventBubbue.jsp</title>
<style>
	div{margin: 100px; border: 1px solid blue;}
</style>
<script>
function init(){
	var grand = document.getElementById("grand");
	var parent = document.getElementById("parent");
	var child = document.getElementById("child");
	
	grand.addEventListener("click",function(){ alert("grand click")})
	parent.addEventListener("click",function(){ alert("parent click")})
	child.addEventListener("click",function(){ 
										alert("child click");
										event.stopPropagation();//이벤트 전파 중지							
										})
}
window.addEventListener("load",init);
					//페이지를 실행할때 init를 실행함
/* window.onload = function(){
		alert('방가');	
} */
</script>
</head>
<body>
<h3>이벤트 전파(propergation)</h3>
<div id="grand">
할아버지
	<div id="parent">
	아버지
		<div id="child">
		손자
		</div>
	</div>
</div>
</body>
</html>