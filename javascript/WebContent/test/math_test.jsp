<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>math_test.jsp</title>
</head>
<body>
	<H4>가위바위보 게임</H4>
	<script>
		var game = prompt("가위바위보 입력 골라라", "가위");
		var gameNum;
		var str;
		var str2;
		var com = Math.ceil(Math.random() * 3);
		switch (game) {
		case "가위":
			gameNum = 1;
			str="가위";
			break;
		case "바위":
			gameNum = 2;
			str="바위";
			break;e
		case "보":
			gameNum = 3;
			str="보";
			break;
		default:
			alert("잘못 작성했습니다.");
			location.reload();//F5 새로고침기능
		}

		if (gameNum == com) {
			document.write("1은 가위 2는 바위 3은 보 <br>")
			document.write("작성자는 " + gameNum + "이다. <br>")
			document.write("컴퓨터는 " + com + "이다. <br>")
			document.write("비겼다");
		} else if (gameNum == 1 && com == 3 || gameNum == 2 && com == 1
				|| gameNum == 3 && com == 2) {
			document.write("1은 가위 2는 바위 3은 보 <br>")
			document.write("작성자는 " + gameNum + "이다. <br>")
			document.write("컴퓨터는 " + com + "이다. <br>")
			document.write("작성자가 이김");
		} else if (gameNum == 1 && com == 2 || gameNum == 2 && com == 3
				|| gameNum == 3 && com == 1) {
			document.write("1은 가위 2는 바위 3은 보 <br>")
			document.write("작성자는 " + gameNum + "이다. <br>")
			document.write("컴퓨터는 " + com + "이다. <br>")
			document.write("컴퓨터가 이김");
		}
	</script>
</body>
</html>