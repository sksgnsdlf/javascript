<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object.jsp</title>
</head>
<body>
<H4>자바스크립트 Object</H4>
<script>
	var emp = {emp_id : 100, first_name : '홍길동', email : 'ch@na.com'};
	document.write(emp.first_name +"<br>");
	
	//같은 개념이다. 
	var arr = [];
	arr["emp_id"] =100;
	arr["first_name"] = "first_name";
	document.write(arr.emp_id +"<hr><br>");
	
//List<DTO>
var arrEmp = [ 
	{emp_id : 100, first_name : '홍길동', email : ['ch@na.com','aa@na.com']},
	{emp_id : 101, first_name : '유관순', email : ['ch1@da.com','aa2@da.com']},
	{emp_id : 102, first_name : '을지문덕', email : 'ch2@za.com'}
]
//첫번째 사원을 이름 출력
document.write(arrEmp[0].first_name + "<br>");

//두번째사원의 이메일 출력
document.write(arrEmp[1].email + "<br>");

//모든사원의 이름을 출력
for(i=0; i<arrEmp.length; i++){
	document.write(arrEmp[i].first_name + "<br>");
}

//두번째사원의 두번째이메일 출력
document.write(arrEmp[1].email[1] + "<br>");
</script>
</body>
</html>