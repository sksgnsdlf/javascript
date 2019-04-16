<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeeInsert.jsp</title>
<script src="../js/ajax.js"></script>
<script>
	function findManager() {
		//ajax 요청	//댓글등록참조
		var param = "id=" + frm.manager_id.value;
		new ajax.xhr.Request("../EmpServlet", param, findManagerCallback, 'GET');
	}
	function findManagerCallback(req) {
		//return 결과중에서 first_name, last_name을 span태그에 출력
		if (req.readyState == 4) { //응답이 완료
			if (req.status == 200) { //정상실행  				
				var result = JSON.parse(req.responseText);
				document.getElementById("manager_name").innerHTML = result.first_name
						+ " " + result.last_name;
			}
		}
	}
</script>
</head>
<body>
	<form name="frm">
		부서번호 <input type="text" name="department_id"> <span
			id="department_name"><br></span> 매니저 <input type="text" name="manager_id"
			onchange="findManager()"> <span id="manager_name"></span>
	</form>
</body>
</html>