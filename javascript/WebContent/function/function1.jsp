<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>function1.jsp</title>
</head>
<body>
<script>
	var count=0;
	
	//함수호출(실행)
	myfunc();

	//함수선언
	function myfunc(){
		count++;
		document.write("myfunc : " + count + "<br>");
	}
	//익명함수선언해서 변수에 저장 (=함수선언과 같음)
	var myfunc2 = function(){
		count++;
		document.write("myfunc2 : " + count + "<br>");
	}
	
	//함수호출(실행)
	myfunc2();
	
	//즉시함수 실행 (함수정의와 실행을 동시에 함)
	(function(){
		count++;
		document.write("즉시실행" + count +"<br>");
	}());
</script>
</body>
</html>