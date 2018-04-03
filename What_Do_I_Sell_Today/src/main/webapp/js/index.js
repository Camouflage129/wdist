$(function(){
	$("button").click(function(){
		switch($(this).attr("id")) {
		case "loginBtn" :
			//Ajax써서 로그인 실행시키기
			break;
		case "closeBtn" :
			$("#loginModal").dialog("close");
			break;
		}		
	});
	
	$("#loginA").click(function(){
		$("#loginModal").dialog();
		$(".ui-button").hide();
	});
	
	$("#signUpA").click(function(){
		location.href="index.jsp?content=WEB-INF/views/user/signUp.jsp";
		//WEB-INF있는 부분은 나중에 Controller에서 처리해주어야 한다.
	});
})