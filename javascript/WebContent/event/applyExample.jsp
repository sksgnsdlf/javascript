<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applyExample</title>
</head>
<body>
<script>
	function class1(){
		this.name = 'class1';
		this.getName = function(){
			alert(this.name);
		}
	}
	function class2(){
		this.name = 'class2';
		this.getName = function(){
			alert(this.name);
		}
	}
	var c1 = new class1();
	var c2 = new class2();
	c1.getName();			 //c1클래스만 사용함
	c1.getName.apply(c2);    //c1.getName으로 되어있지만 apply로 c2클래스를 지정시켜서 
							 //class2의 alert가 뜨는것
</script>
</body>
</html>