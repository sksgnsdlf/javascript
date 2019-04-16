<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>window.jsp</title>
</head>
<body onload="init()">
<input type="text" id="addr"/>
<button type="button" onclick="win_open()">새창열기</button>
<button type="button" onclick="win_close()">새창닫기</button>
<script src="js/cookie.js"></script>
<script>
var newWin; //변수선언
function init(){
	//var popup = getCookie("popup");
	var popup = sessionStorage.getItem("popup");
	if(popup != 'N'){
	window.open("popup.jsp","popup",
	"width=300,height=200,left=600,top=400");
}}
function win_close(){
	newWin.close();
}
function win_open(){ //close를 할땐 전역변수로 만들어야함
	newWin = window.open("findaddr.jsp","naver",
			"width=400,height=400,left=400,top=400");
}
</script>
</body>
</html>