<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date.jsp</title>
</head>
<body>
<h4>날짜 출력</h4>
<script>
	var today = new Date();
	document.write(today + "<br>");
	document.write(today.getFullYear() + "년 <br>");
	//월, 일, 요일번호 출력
	document.write(today.getMonth()+1 + "월 ");
	document.write(today.getDate() + "일 ");
	document.write(today.getDay() + "화요일 <br>"); //일요일(0)~토요일(6)
	
</script>
</body>
</html>