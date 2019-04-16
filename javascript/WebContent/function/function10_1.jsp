<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function10_1.jsp</title>
<script>
	//객체생성자함수를 이용하여 클래스 선언
	function CalcBMI(a,b){
		this.a = a; // 몸무게
		this.b = b; // 신장
		this.bmi = a / (b/100 * b/100);  			//그냥 this
	}
	
	//프로토타입을 이용해서 메서드 추가 선언
	CalcBMI.prototype.bmi = a / (b/100 * b/100); //프로토타입(메모리절약) 
	
	this.getBmi = function(){
		return this.bmi.toFixed(2);
	}
	
	function calc(){
		//텍스트필드의 값 조회 : value
		var w = parseFloat(document.getElementById("w").value);
		var h = parseFloat(document.getElementById("h").value);
		//객체생성 
		var c = new CalcBMI(w,h);
		//결과를 div태그에 출력 innerHTML 사용
		document.getElementById("demo").innerHTML = 'bmi는 ' + c.getBmi();
	}
</script>
</head>
<body>
<h3>클래스(객체)선언</h3>
신장<input type="text" id="h">
체중<input type="text" id="w">
<button type="button" onclick="calc()">계산</button>
<div id="demo"></div>

</body>
</html>