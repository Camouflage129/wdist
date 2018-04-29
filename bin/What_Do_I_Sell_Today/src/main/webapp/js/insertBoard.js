$(function(){
	var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload) return "작성하시던 게시글이 모두 삭제됩니다. 그래도 이동하시겠습니까?";
    });
	
	$("#cancel").click(function(){
		checkUnload = false;
		var result = confirm('작성하시던 게시글이 모두 삭제됩니다. 그래도 이동하시겠습니까?');
		if(result) {
			location.href="/deleteFiles.do?type="+$("#type").val();
		}
	});
	
	$("#submit").click(function(){
		checkUnload = false;
	});
})