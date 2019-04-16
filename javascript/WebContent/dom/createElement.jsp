<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createElement.jsp</title>
<script>
	function addSubject(){							//.value는 input value를 말함
		var txt = document.getElementById("subjectName").value;
		var parent = document.getElementById("subject");
		//li태그 생성
		var newNode = document.createElement("li");
		newNode.innerHTML = txt;
		//이벤트 추가
		newNode.onclick= function(){
			newNode.style.color = "blue";
			newNode.style.backgroundColor = "yellow";
		}
		parent.appendChild(newNode);
		//텍스트필드 클리어
		document.getElementById("subjectName").value= "";
	}
</script>
</head>
<body>
<input type="text" id="subjectName">
<button onclick="addSubject()">추가</button>
<ul id="subject">
	<li>java</li>
</ul>
</body>
</html>