//eventBasic.js
    function doProcess(){
		alert('event attr:\n이벤트 발생');
    }
    function doProcess2(){
		alert('event attr:\n이벤트 발생2');
    }
    //image click handler
    function doProcess3(){
        this.style.display = 'none';
    }
    window.onload = function(){ // document.getElementById("btn1").onclick = doProcess; // document.getElementById("btn1").onclick = doProcess2;
        //var btn = document.getElementById("btn1"); //btn.addEventListener("click",doProcess); //btn.addEventListener("click",doProcess2); //btn.addEventListener("mouseover",doProcess); //btn.addEventListener("mouseover",doProcess2);
        var imgs = document.getElementsByTagName("img"); //배열이다
        for(i=0; imgs.length; i++){
        imgs[i].addEventListener("click",doProcess3);
        }
    }