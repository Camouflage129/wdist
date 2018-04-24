	$("#pw3").blur(function() {
		var ch = /[a-z0-9_-]{4,15}/;
		var pw = $("#pw3").val();
		
		if( pw == "" || !ch.test(pw) ) {
			$("#pwDiv3").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pw_feedback3").attr("class","invalid-feedback");
			$("#pw_feedback3").html("형식에 맞춰서 입력해주세요.");
		} else{
			$("#pwDiv3").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pw_feedback3").attr("class","valid-feedback");
			$("#pw_feedback3").html("입력완료.");
		}
	});

	$("#pw_Check3").keyup(function() {
		var check = /[a-z0-9_-]{4,15}/;
		var pwch = $("#pw_Check3").val();
		
		if( pwch == $("#pw3").val()) {
			$("#pwCkDiv3").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pwCheck_feedback3").attr("class","valid-feedback");
			$("#pwCheck_feedback3").html("비밀번호가 일치합니다.");
		} else if ( pw == "" || !check.test(pwch)) {
			$("#pwCkDiv3").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pwCheck_feedback3").attr("class","invalid-feedback");
			$("#pwCheck_feedback3").html("형식에 맞춰서 입력해주세요.");
		} else {
				$("#pwCkDiv3").attr("class", "form-group has-danger");
				$(this).attr("class","form-control is-invalid");
				$("#pwCheck_feedback3").attr("class","invalid-feedback");
				$("#pwCheck_feedback3").html("비밀번호가 일치하지 않습니다.");
			}					
	});
	








