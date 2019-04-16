<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
</head>
<body>
<h3>달력만들기</h3>
<script>
	var cal = new Date(2019, 2,1);
	var weekNo = cal.getDay(); //요일 번호
	//document.write(weekNo); 3월1일은 목요일이라서 5 나옴
	
	//할일
	//해당월 마지막 날짜 계산
	//시작요일 앞까지 빈칸출력(3월첫째주는 일요일~수요일까지 2월달이라서 다른 for해야함)
	//시작일부터(1) 부터 마지막 날짜 반복 출력(물론 3월1일(목요일)부터도 for사용)
	//정보를 하나주면 마지막날짜를 구하는 함수가 있다 밑에꺼 참조?
	//var lastDay = ( new Date( 년도입력, 월입력, 0) ).getDate();

</script>
</body>
</html>