<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var p = 0;
function loadEmp(){
	//1. 객체생성
	var xhr = new XMLHttpRequest();
	//2. 콜백함수
	xhr.onreadystatechange = function(){
		if(xhr.readyState = 4 && xhr.status == 200){
			//dom
			var list = JSON.parse(xhr.responseText);
			var html="";
			for(i=0; i<list.length; i++){
				html += "<span>" + list[i].first_name + "</span>";
				html += "<span>" + list[i].last_name + "</span><br>";
				document.getElementById("demo").innerHTML += html;
			}
			//document.getElementById("demo").innerHTML += xhr.responseText +"<hr>";
		}
	}
	//3. 서버요청준비
	var param = "?p=" + (++p);
	xhr.open("get","../server/selectEmp.jsp" + param);
	//4. 요청
	xhr.send();
}
</script>
</head>
<body>
<h3>사원목록</h3>
<div id="demo"></div>
<button type="button" onclick="loadEmp()">more</button>
</body>
</html>