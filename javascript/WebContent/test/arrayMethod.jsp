<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arrayMethod.jsp</title>
</head>
<body>
<h4>배열 메서드</h4>
<input type="text" id="in"/><button type="button" onclick="addSel()">추가</button><br>
<select id="left" size="5">
	<option>사과
	<option>배
	<option>바나나
	</option>
</select>
<button type="button" onclick="toright()">▶</button>
<select id="right" size="5"> </select>
<script>
document.title = ""
function addSel(){
	var txt = document.getElementById("in").value;
	document.getElementById("left").innerHTML += "<option>" + txt;
	
}
function toright(){
	var idx = document.getElementById("left").selectedIndex; //선택한 옵션
	var x = document.getElementById("left").options[idx]; 
	document.getElementById("right").add(x,0);
	//document.getElementById("left").remove(0,x);	
	
}
</script>
</body>
</html>