<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>documentlinks.jsp</title>
<script>
	window.onload = function(){
		//var a = document.links; //links는 배열이다.
		for (i=0; i<document.links.length; i++){
			//href 속성을 div태그에 출력
			document.getElementById("demo").innerHTML += document.links[i].href +"<br>";
		}
}
</script>
</head>
<body>
<a href="java.html">자바</a>
<a href="jsp.html">JSP</a>
<a href="spring.html">스프링</a>
<div id="demo">
</div>
</body>
</html>