var newWin; //변수선언
function init(){
	var popup = getCookie("popup");
	if(popup != 'N'){
	window.open("popup.jsp","popup",
	"width=300,height=200,left=600,top=400");
}}
function win_close(){
	newWin.close();
}
function win_open(){ //close를 할땐 전역변수로 만들어야함
	newWin = window.open("findaddr.jsp","naver",
			"width=400,height=400,left=400,top=400");
}