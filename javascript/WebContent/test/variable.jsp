<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	//"use strict"; //var을 이용해서 변수 선언해야 사용가능
	function getName(){
		const x=10; //상수선언, 변경불가
		x=5;
		{
		var nane='김길동'; //var 없는게 전역변수
		let x=2;		//{ }안에서만 사용하는 변수
		}
		console.log(x);
	}
	function getName2(){
		console.log(nane);
	}
	getName();
	getName2();
</script>
<h4>변수선언</h4>
</body>
</html>