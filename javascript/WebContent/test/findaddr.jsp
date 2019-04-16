<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findaddr.jsp</title>
</head>
<body>
	<h4>주소검색</h4>
	<a href="#" onclick="selAddr('대구')">대구</a>
	<br>
	<a href="#" onclick="selAddr('부산')">부산</a>
	<br>
	<script>
function selAddr(addrText){
	if( confirm("주소 선택할까요?")){
	opener.document.getElementById("addr").value=addrText;  //opener:부모창
	window.close();										//window:현재 창
	}	
}
function win_close(){
	window.close(); 
}
</script>
	<button type="button" onclick="win_close()">창닫기</button>
</body>
</html>