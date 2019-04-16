<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function3.jsp</title>
<style>

</style>
<script>
	//이름과 지역을 인수로 받아서 출력
	function myfunc(name, area){
		if(area == undefined || area == null){ //둘다하는게 좋음
			area = '대구';
		}
		document.write(name + " : " + area + "<br>");
	}
	
	myfunc();
	myfunc("홍길동");
	myfunc("유관순","천안");
	myfunc("유관순","천안","10");
	
	//가변인자
	function sum(){
		var total = 0;
		for(i=0; i<arguments.length; i++){
			total += arguments[i];
		}
		//document.write("합계 : " + total + "<br>");
		return total;
	}
	var a = sum(10);
	document.write(sum(10,20));
	//sum(10,20,30);
</script>
</head>
<body>

</body>
</html>