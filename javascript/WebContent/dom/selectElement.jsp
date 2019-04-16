<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectElement.jsp</title>
<script>
	function changeSize(){
		//태그 명으로 찾는다. 	     //밑에 복수형(s)주위하라
		//var imgList = document.getElementsByTagName("img");
		//var imgList = document.getElementsByClassName("main");
		var imgList = document.querySelectorAll("img.main");
		for(i=0; i<imgList.length; i++){
			imgList[i].style.width = "200px";
		}
	}
</script>
</head>
<body>
<button type="button" onclick="changeSize()">모두 크기변경</button>
<img class="main" src="../images/Desert.jpg"/>
<img src="../images/Desert.jpg"/>
<img class="main" src="../images/Koala.jpg"/>
</body>
</html>