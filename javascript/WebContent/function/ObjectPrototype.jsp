<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectPrototype.jsp</title>
</head>
<body>

<script>
	function Emp(id, name, sal){
		this.empid = id;
		this.firstName = name;
		this.sal = sal;
	}
	
	Emp.prototype = { 
			getEmpid : function(){ return this.empid; },
			getfirstName : function(){ return this.firstName; },
			getsal : function(){ return this.sal; }
	}
	
	var emp = new Emp(100,"홍길동",2000);
	document.write(emp.getEmpid() +"<br>");
	document.write(emp.getfirstName() +"<br>");
	document.write(emp.getsal());
</script>
</body>
<h3> {  } 형식으로 프로토타입 메서드 추가</h3>
</html>