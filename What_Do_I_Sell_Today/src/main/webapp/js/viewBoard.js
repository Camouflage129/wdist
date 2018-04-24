$(function(){
	
	
	$("#deleteBtn").click(function(){
		var data = confirm("정말 삭제하시겠습니까?");
		if(data)
			location.href="/deleteBoard.do?num="+$("#boardNum").val();
	});
	
	$("#editBtn").click(function(){
			location.href="/editBoard.do?num="+$("#boardNum").val();
	});
	
	$("#beforePost").click(function(){
		$.ajax({
			url: "/checkBoard.do",
			method: "POST",
			type: "JSON",
			data: {
				"num" : $("#beforeNum").val()
			},
			success: function(data) {
				if(data.result == "success")
					location.href="/findBoard.do?num="+$("#beforeNum").val();
				else
					alert("더이상 게시물이 존재하지 않습니다.");
			}
		})
	});
	
	$("#afterPost").click(function(){
		$.ajax({
			url: "/checkBoard.do",
			method: "POST",
			type: "JSON",
			data: {
				"num" : $("#afterNum").val()
			},
			success: function(data) {
				if(data.result == "success")
					location.href="/findBoard.do?num="+$("#afterNum").val();
				else
					alert("더이상 게시물이 존재하지 않습니다.");
			}
		})
	});
})