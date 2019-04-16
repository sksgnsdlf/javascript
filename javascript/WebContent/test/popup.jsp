<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup.jsp</title>
</head>
<body>
<script src="js/cookie.js"></script>
<script> 
	function changePopup(obj){
		if(obj.checked ==true){
			//setCookie("popup","N",1);
			sessionStorage.setItem("popup","N");
		}
	}
</script>
광고팝업 <br>
<input type="checkbox" onclick="changePopup(this)">오늘은 이 창 열지 않기
</body>
</html>