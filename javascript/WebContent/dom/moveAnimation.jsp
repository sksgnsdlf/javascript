<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moveAnimation.jsp</title>
<style>
#container {
  width: 400px;
  height: 400px;
  position: relative;
  background: yellow;
}
#animate {
  width: 50px;
  height: 50px;
  position: absolute;
  background: red;
}
</style>
<script>
function myMove() {
	  var elem = document.getElementById("animate"); 
	  var pos = 0;
	  var id = setInterval(frame, 5);
	  function frame() {
	    if (pos == 350) {
	      clearInterval(id);
	    } else {
	      pos++; 
	      elem.style.top = pos + 'px'; 
	      elem.style.left = pos + 'px'; 
	    }
	  }
	}
	window.onload = function(){
		myMove();
	}
</script>
</head>
<body>
<div id ="container">
  <img id ="animate" src="../images/Koala.jpg"/>
</div>
</body>
</html>