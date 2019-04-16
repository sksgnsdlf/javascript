<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function2.jsp</title>
</head>
<body>
<button type="button" onclick="changeColor()">배경색바꾸기</button>
<script>
	var color = ['white','yellow','green','aqua'];
	var i=0;
	
	function changeColor(){
		//i증가
		i++;
		
		//i가 배열수보다 크면 다시 0으로 
		if(i>=color.length){
			i=0;
		}
		//배경색 변경
		document.body.style.backgroundColor = color[i];
	}
</script>
</body>
</html>