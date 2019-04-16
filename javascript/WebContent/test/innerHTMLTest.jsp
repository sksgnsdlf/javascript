<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div { border: 1px blue solid; height: 50px;}
</style>
<script>
	var cnt=0;
	var truee=0;
	var falsee=0;
	//틀린횟수, 맞는 횟수
	function sum(){
		cnt++;
		num1 = document.getElementById("num1").value;
		num2 = document.getElementById("num2").value;
		result = document.getElementById("result").value;
		//div 태그에 결과 출력
		document.getElementById("demo").innerHTML = parseInt(num1) + parseInt(num2);
		
		if (parseInt(num1)+ parseInt(num2) == result){
			document.getElementById("demo").innerHTML = "맞다";
			truee++;
		}else{
			document.getElementById("demo").innerHTML = "아니다";
			falsee++;
		}
		//숫자 랜덤
		document.getElementById("num1").value= Math.floor(Math.random() * 10);
		document.getElementById("num2").value= Math.floor(Math.random() * 10);
		document.getElementById("result").value="";
		
		//cnt가 10회 이상이면 틀린수,맞는갯수를 출력하고 버튼은 비활성화시켜야함
		if(cnt>=10)
			document.getElementById("btn").disabled = "disabled";
			document.getElementById("demo").innerHTML = "맞는횟수 =" + truee + "&nbsp;&nbsp;&nbsp;&nbsp;틀린횟수 =" + falsee;
	}
	
	function gamestart(){
		//변수 초기화
		cnt=0;
		truee=0;
		falsee=0;
		//div 태그 내용 삭제
		//num1 num2 난수
		document.getElementById("num1").value= Math.floor(Math.random() * 10);
		document.getElementById("num2").value= Math.floor(Math.random() * 10);
		document.getElementById("demo").innerHTML="";
		document.getElementById("btn").disabled = "";
	}
</script>
</head>
<body>
<input id="num1" value="10"/>+<input id="num2" value="20"/>=
<input id="result" value=""/>
<button type="button" id="btn" onclick="sum()" >결과확인</button>
<button type="button" onclick="gamestart()" id="btn">게임시작</button>
<div id="demo"></div>
</body>
</html>