<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxBasic.jsp</title>
<style>
	div{ width: 400px; height:300px; border:1px solid blue}
</style>
<script>
function loadDoc(url) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("demo").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", url, true);
	  xhttp.send();
	}
</script>
</head>
<body>
<h3>ajax를 이용한 레이아웃</h3>
<span onclick="loadDoc('../server/a.jsp')">공지사항</span>  
<span onclick="loadDoc('../server/b.jsp')">일반게시판</span>
<div id="demo"></div>
</body>
</html>