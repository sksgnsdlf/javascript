<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head><title>timer_imageSliser.jsp</title>
<script>
var arrImage =  ["images/Chrysanthemum.jpg",     "images/Desert.jpg",
                 "images/Hydrangeas.jpg",        "images/Jellyfish.jpg",
                 "images/Koala.jpg",             "images/Lighthouse.jpg",
                 "images/Penguins.jpg",          "images/Tulips.jpg"]; 
                 
var pos = 0 ; // �̹��� ��ġ �ε���
var timer;
function init(){
	document.getElementById("slider").src= "./"+arrImage[pos];
	//Ÿ�̸�
	timer = setInterval(right,1000);
}
function right(){
	if(pos==7||pos<0)
	document.getElementById("slider").src= "./"+arrImage[pos];
	else
	document.getElementById("slider").src= "./"+arrImage[++pos];
}
function left(){
	if(pos==0)
	document.getElementById("slider").src= "./"+arrImage[pos];
	else document.getElementById("slider").src= "./"+arrImage[--pos];
}
function stop(){
	clearInterval(timer); //Ÿ�̸� ����
}

</script>
</head>
<body onload="init();">
<!-- imageSlider.jsp -->
�̹��� �����̴� <hr>
<img id="slider" src="" 
    style="width: 200px;height: 200px; position: relative; left: 100px;"><br>
<input type="button" value="��" onclick="left()"/> 
<input type="button" value="��" onclick="right()"/>
<input type="button" value="����" onclick="stop()"/>
</body>
</html>