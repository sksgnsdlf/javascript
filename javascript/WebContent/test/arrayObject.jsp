<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arrayObject.jsp</title>
</head>
<body>
<h4>자바스크립트 배열과 객체(매우중요!!!!!!!!)</h4>
<script>
//배열선언
var arr = ['사과',"배",10]; //어떤타입이든 가능

//값변경
arr[0] = "키위";

//생성자 형식으로 배열 선언
var arr2 = new Array('java','jsp','spring');
//document.write(arr2[1]);
//document.write("<br>"+ typeof arr);
//document.write("<br>"+ typeof arr2);
for(i=0; i<arr2.length; i++ ){
	document.write(arr2[i]);
}
document.write("<hr>");
//확장 for
for( i in arr2){
	document.write("인덱스값을 가져오는것 : " + i + ":"); //인덱스번호를 가져옴
	document.write(arr2[i] +"<br>"); //안에 내용을 가져옴
}
	
//인덱스 대신에 이름을 가진 배열 (스크립트 특징인데 중요함!!!!!!!!)
var arr3 = []; //new Array() 과 똑같음
arr3["취미"] = "게임";
arr3["운동"] = "달리기";
//document.write("<br>" + arr3["취미"]);
document.write("<hr>");
//확장 for
for( i in arr3){
	document.write("인덱스값을 가져오는것 : " + i + ":");
	document.write(arr3[i] +"<br>");
}
</script>
</body>
</html>