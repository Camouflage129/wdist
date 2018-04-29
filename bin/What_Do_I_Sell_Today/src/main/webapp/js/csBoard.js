$(function(){
	$("#insertBoard").click(function(){
		location.href="/insertBoardGo.do?type="+$("#type").val();
	})
})