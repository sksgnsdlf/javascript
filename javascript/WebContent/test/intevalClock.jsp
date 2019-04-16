<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intevalClock.jsp</title>
</head>
<body>
<div id="demo"> </div>
<script>
function disp(){
	//div 태그에 시간을 출력
	var cur = new Date();
	var cur1= cur.getHours();
	var cur2= cur.getMinutes();
	var cur3= cur.getSeconds();
	
	document.getElementById("demo").innerHTML = cur1+" : " +cur2 +" : " + cur3;
}
setInterval(disp,1000);
</script>
</body>
</html>