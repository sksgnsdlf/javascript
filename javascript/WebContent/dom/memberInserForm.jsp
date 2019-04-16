<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>폼필드 속성(체크,select..)</title>
<script>
	
</script>
<script>
	//validation(유효성) : 입력값 검증
	function check() {
		//var username = document.frm.username.value;
		//var username = document.forms["frm"]["username"].value;
		var username = document.getElementsByName("username")[0].value;
		//var username = document.getElementById("username").value;
		if (username == "") {
			alert("이름을 입력하세요.");
			document.frm.username.focus();
			return false;
		}
		//패스워드 체크
		var userpw = document.frm.userpw.value;
		if (userpw == "") {
			alert("비번을 입력하세요.");
			document.frm.userpw.focus();
			return false;
		}

		//취미 체크
		var chk = document.getElementsByName("hobby");
		var cnt = 0;
		for (i = 0; i < chk.length; i++) {
			//갯수 카운터
			if (chk[i].checked == true) {
				cnt++;
			}
		}
		if (cnt == 0) {
			alert("취미를 선택하세요");
			return false;
		}
		var rdSex = document.getElementsByName("sex");
		var cnt2 = 0;
		for (i = 0; i < rdSex.length; i++) {
			//갯수 카운터
			if (rdSex[i].checked == true) {
				cnt2++;
			}
		}
		if (cnt2 == 0) {
			alert("성별를 선택하세요");
			return false;
		}
		var rdMa = document.getElementsByName("wed");
		var cnt2 = 0;
		for (i = 0; i < rdMa.length; i++) {
			//갯수 카운터
			if (rdMa[i].checked == true) {
				cnt2++;
			}
		}
		if (cnt2 == 0) {
			alert("결혼여부를 선택하세요");
			return false;
		}

		//직업    //window.document는 생략가능
		if (window.document.frm.job.selectedIndex < 1) {
			alert("직업 선택하세요");
			return false;
		}
		return true; //폼을 전송
	}

	//중복체크(ajax)
	function dupCheck() {
		//1. xhr 객체 생성
		var xhttp = new XMLHttpRequest();
		//2. 콜백함수(이벤트 핸들러)
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4) { //서버로 부터 응답완료
				if (this.status == 200) {//정상 실행
					document.getElementById("demo").innerHTML = this.responseText; //dom
				} else {
					document.getElementById("demo").innerHTML = "에러:" + this.status; //정상실행안될지 오류
				}
				//로딩중 이미지를 제거 
			} else {
				//document.getElementById("demo").innerHTML = "처리중"; //로딩중 이미지를 보이게
			}
		};
		var param = "name=" + frm.username.value;
		xhttp.open("post", "../server/nameDupCheck.jsp", true); //false는 동기식 처리
		xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhttp.send(param); 
		console.log("동기식 전송 테스트");
	}
</script>
</head>
<body>
	<!-- memberInserForm.jsp -->
	<form name="frm" onsubmit="return check()">
		이름: <input type="text" name="username" onkeyup="dupCheck()" /> 
		<span id="demo"></span><br> 
		패스워드: <input type="text" name="userpw" /><br>
		관심항목: <input type="checkbox" name="hobby" value="jsp"> 
		JSP <input type="checkbox" name="hobby" value="java" checked="checked">
		JAVA <input type="checkbox" name="hobby" value="jquery">
		JQUERY <br /> 성별: <input type="radio" name="sex" value="M">
		남자 <input type="radio" name="sex" value="F"> 여자 <br /> 결혼여부:
		<input type="radio" name="wed" value="1"> 미혼 <input
			type="radio" name="wed" value="2"> 기혼 <br /> 직업<select
			name="job">
			<option>직업선택
			<option>프로그래머
			<option>디자이너
			<option>웹퍼블리셔
		</select><Br> <input type="submit" value="등록"> <input type="reset"
			value="초기화">
	</form>
</body>
</html>