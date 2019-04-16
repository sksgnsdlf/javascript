<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>splitTest.jsp</title>
</head>
<body>
<h4>split test</h4>
<script>
	var str = '1월,2월,3월,4월,5월,6월';
	var months = str.split(",");
	for(i=0; i<months.length; i++){
		document.write(months[i] +"<br>");
	}
	//배열 ->string
	var arr = ["사과","배","딸기"];
	document.write(arr.length + "<br>"); //3
	
	var str = arr.join("--"); //String으로 자동변환
	document.write(str.length + "<br>"); //9
	document.write(str +"<br>") //사과--배--딸기
	</script>
</body>
</html>