<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function10.jsp</title>
<script>
	//객체생성자함수를 이용하여 클래스 선언
	function Calc(a,b,c){
		this.a = a; //(전역)변수 선언과 초기화를 동시에 함
		this.b = b; //(전역)변수 선언과 초기화를 동시에 함
		this.result = a+b;  //(전역)변수 선언과 초기화를 동시에 함
		var c;      //지역변수 선언
		
		this.getResult = function(){
			return this.result;
		}
	}
	//객체 생성
	var c =new Calc(100,300);
	document.write(c.getResult());
</script>
</head>
<body>
<h3>클래스(객체)선언</h3>
</body>
</html>