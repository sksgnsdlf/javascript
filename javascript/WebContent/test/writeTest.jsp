<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeTest.jsp</title>
</head>
<body>
<script>
	document.write("<table border=1>");
	for(i=0; i<10; i++){
		document.write("<tr><td>" + i + "</td><tr>");
	}
	doucment.write("</table>")
</script>
</body>
</html>