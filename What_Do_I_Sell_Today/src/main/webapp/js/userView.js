var re = '';

	$("#ModifyName").blur(function(){
		var han = /[가-힣]{2,}/;
		var name = $("#ModifyName").val() ; 
			
		if ( name == "" || !han.test(name) ) {			
			$("#ModifyNameDiv").attr("class", "form-group has-danger");
			$(this).attr("class", "form-control is-invalid");
			$("#ModifyName_feedback").attr("class", "invalid-feedback");
			$("#ModifyName_feedback").html("이름을 정확히 입력해주세요.");	
			re += 0;
		} else {
			$("#ModifyNameDiv").attr("class", "form-group has-success");
			$(this).attr("class", "form-control is-valid");
			$("#ModifyName_feedback").attr("class", "valid-feedback");
			$("#ModifyName_feedback").html("입력완료");
			re += 1;
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
				re += 0;
			} else {
				$("#ModifyEmailDiv").attr("class", "form-group has-success");
				$(this).attr("class", "form-control is-valid");
				$("#ModifyEmail_feedback").attr("class", "valid-feedback");
				$("#ModifyEmail_feedback").html("입력완료");
				re += 1;
			}
	});

	$("#ModifyPw").blur(function() {
		var mCh = /[a-z0-9_-]{4,15}/;
		var mPw = $("#ModifyPw").val();
		
		if( mPw == "" || !mCh.test(mPw) ) {
			$("#ModifyPwDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#ModifyPw_feedback").attr("class","invalid-feedback");
			$("#ModifyPw_feedback").html("형식에 맞춰서 입력해주세요.");
		} else{
			$("#ModifyPwDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#ModifyPw_feedback").attr("class","valid-feedback");
			$("#ModifyPw_feedback").html("입력완료.");
			re += 2;
		}
	});

	$("#ModifyPw_Check").keyup(function() {
		var mCheck = /[a-z0-9_-]{4,15}/;
		var mPwch = $("#ModifyPw_Check").val();
		
		if( mPwch == $("#ModifyPw").val()) {
			$("#ModifyPwCkDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#ModifyPwCheck_feedback").attr("class","valid-feedback");
			$("#ModifyPwCheck_feedback").html("비밀번호가 일치합니다.");
			re += 2;
		} else if ( $("#ModifyPw").val()  == "" || !mCheck.test(mPwch)) {
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
	

	$("#pwdans").blur(function() {
		var ansCheck = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/
		
		if( $("#pwdans").val() == "" || !ansCheck.test($("#pwdans").val()) ) {
			$("#pwdansDiv2").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pwdans_feedback2").attr("class","invalid-feedback");
			$("#pwdans_feedback2").html("답변을 입력해주세요.");
		} else{
			$("#pwdansDiv2").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pwdans_feedback2").attr("class","valid-feedback");
			$("#pwdans_feedback2").html("입력완료.");
			re += '3';
		}
	});

	
	
	
/* function result(){
	 if(re == '11' || re == '1'){
		 return true;
		 
	 } else if( re == '1122'){
		 return true;		 
	 } else if( re == '113' || re == '11223'){
		 return true;
	 }else{
		 alert(re + " : 에러~~~~~~~~");
		 return false;
	 }
 }*/

 function result(){
	 if(re == '11' || re == '1'){//이름 혹은 이메일
		 return true;
	 } else if( re == '1122'){//이름,이메일,패스워드
		 return true;		 
	 } else if( re == '13' || re == '113' || re == '11223'){//이름,이메일,힌트답 혹은 이름,이메일,패스워드,힌트답
		 return true;
	 }else{
		 alert(re + " : 에러~~~~~~~~");
		 return false;
	 }
 }






