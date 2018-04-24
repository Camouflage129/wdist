
	$("#ModifyName").blur(function(){
		var han = /[가-힣]{2,}/;
		var name = $("#ModifyName").val() ; 
			
		if ( name == "" || !han.test(name) ) {			
			$("#ModifyNameDiv").attr("class", "form-group has-danger");
			$(this).attr("class", "form-control is-invalid");
			$("#ModifyName_feedback").attr("class", "invalid-feedback");
			$("#ModifyName_feedback").html("이름을 정확히 입력해주세요.");		
		} else {
			$("#ModifyNameDiv").attr("class", "form-group has-success");
			$(this).attr("class", "form-control is-valid");
			$("#ModifyName_feedback").attr("class", "valid-feedback");
			$("#ModifyName_feedback").html("입력완료");		
		}		
	});


	$("#ModifyEmail").blur(function() {
			var re = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var email = $("#ModifyEmail").val() ; 
			
			if ( email == "" || !re.test(email) ) {			
				$("#ModifyEmailDiv").attr("class", "form-group has-danger");
				$(this).attr("class", "form-control is-invalid");
				$("#ModifyEmail_feedback").attr("class", "invalid-feedback");
				$("#ModifyEmail_feedback").html("Email 형식에 맞춰서 Email을 입력해주세요.");		
			} else {
				$("#ModifyEmailDiv").attr("class", "form-group has-success");
				$(this).attr("class", "form-control is-valid");
				$("#ModifyEmail_feedback").attr("class", "valid-feedback");
				$("#ModifyEmail_feedback").html("입력완료");		
			}
	});

	$("#ModifyPw").blur(function() {
		var ch = /[a-z0-9_-]{4,15}/;
		var pw = $("#ModifyPw").val();
		
		if( pw == "" || !ch.test(pw) ) {
			$("#ModifyPwDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#ModifyPw_feedback").attr("class","invalid-feedback");
			$("#ModifyPw_feedback").html("형식에 맞춰서 입력해주세요.");
		} else{
			$("#ModifyPwDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#ModifyPw_feedback").attr("class","valid-feedback");
			$("#ModifyPw_feedback").html("입력완료.");
		}
	});

	$("#ModifyPw_Check").keyup(function() {
		var check = /[a-z0-9_-]{4,15}/;
		var pwch = $("#ModifyPw_Check").val();
		
		if( pwch == $("#ModifyPw").val()) {
			$("#ModifyPwCkDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#ModifyPwCheck_feedback").attr("class","valid-feedback");
			$("#ModifyPwCheck_feedback").html("비밀번호가 일치합니다.");
		} else if ( pw == "" || !check.test(pwch)) {
			$("#ModifyPwCkDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#ModifyPwCheck_feedback").attr("class","invalid-feedback");
			$("#ModifyPwCheck_feedback").html("형식에 맞춰서 입력해주세요.");
		} else {
				$("#ModifyPwCkDiv").attr("class", "form-group has-danger");
				$(this).attr("class","form-control is-invalid");
				$("#ModifyPwCheck_feedback").attr("class","invalid-feedback");
				$("#ModifyPwCheck_feedback").html("비밀번호가 일치하지 않습니다.");
			}					
	});
	








