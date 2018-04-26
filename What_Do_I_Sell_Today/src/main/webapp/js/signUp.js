var signup='';

$("#id").blur(function(){
	if($("#id").val() == ""){
		$("#idDiv").attr("class", "form-group has-danger");
		$(this).attr("class","form-control is-invalid");
		$("#id_feedback").attr("class","invalid-feedback");
		$("#id_feedback").html("공백은 입력하실 수 없습니다. ID를 입력해주세요.");
		
	}else if(!($("#id").val()).match(/[0-9]|[a-z]|[A-Z]/)){
		$("#idDiv").attr("class", "form-group has-danger");
		$(this).attr("class","form-control is-invalid");
		$("#id_feedback").attr("class","invalid-feedback");
		$("#id_feedback").html("영문과 숫자만 사용해주세요.");
	}else{		
		$.ajax({
			url : "checkId.do",
			method : "POST",
			type : "JSON",
			data : {
				id : $("#id").val()
			},
			success : function(data) {				
				if(data == 'true'){
					$("#idDiv").attr("class", "form-group has-danger");
					$(this).attr("class","form-control is-invalid");
					$("#id_feedback").attr("class","invalid-feedback");
					$("#id_feedback").html("이미 사용중인 ID 입니다.");					
				}else{
					$("#idDiv").attr("class", "form-group has-success");
					$("#id").attr("class", "form-control is-valid");
					$("#id_feedback").attr("class", "valid-feedback");
					$("#id_feedback").html("사용할 수 있는 ID 입니다.");
					signup += '1';
				}				
			}						
		})
	}
});


	$("#name").blur(function(){
		var han = /[가-힣]{2,}/;
		var name = $("#name").val() ; 
			
		if ( name == "" || !han.test(name) ) {			
			$("#nameDiv").attr("class", "form-group has-danger");
			$(this).attr("class", "form-control is-invalid");
			$("#name_feedback").attr("class", "invalid-feedback");
			$("#name_feedback").html("이름을 정확히 입력해주세요.");		
		} else {
			$("#nameDiv").attr("class", "form-group has-success");
			$(this).attr("class", "form-control is-valid");
			$("#name_feedback").attr("class", "valid-feedback");
			$("#name_feedback").html("입력완료");		
			signup += '1';
		}		
	});


	$("#email").blur(function() {
			var re = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var email = $("#email").val() ; 
			
			if ( email == "" || !re.test(email) ) {			
				$("#email").attr("class", "form-group has-danger");
				$(this).attr("class", "form-control is-invalid");
				$("#email_feedback").attr("class", "invalid-feedback");
				$("#email_feedback").html("Email 형식에 맞춰서 Email을 입력해주세요.");		
			} else {
				$("#emailDiv").attr("class", "form-group has-success");
				$(this).attr("class", "form-control is-valid");
				$("#email_feedback").attr("class", "valid-feedback");
				$("#email_feedback").html("입력완료");
				signup += '1';
			}
	});

	$("#pw").blur(function() {
		var ch = /[a-z0-9_-]{4,15}/;
		var pw = $("#pw").val();
		
		if( pw == "" || !ch.test(pw) ) {
			$("#pwDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pw_feedback").attr("class","invalid-feedback");
			$("#pw_feedback").html("형식에 맞춰서 입력해주세요.");
		} else{
			$("#pwDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pw_feedback").attr("class","valid-feedback");
			$("#pw_feedback").html("입력완료.");
			signup += '1';
		}
	});

	$("#pw_Check").keyup(function() {
		var check = /[a-z0-9_-]{4,15}/;
		var pwch = $("#pw_Check").val();
		
		if( pwch == $("#pw").val()) {
			$("#pwCkDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pwCheck_feedback").attr("class","valid-feedback");
			$("#pwCheck_feedback").html("비밀번호가 일치합니다.");
			signup += '1';
		} else if ( pw == "" || !check.test(pwch)) {
			$("#pwCkDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pwCheck_feedback").attr("class","invalid-feedback");
			$("#pwCheck_feedback").html("형식에 맞춰서 입력해주세요.");
		} else {
				$("#pwCkDiv").attr("class", "form-group has-danger");
				$(this).attr("class","form-control is-invalid");
				$("#pwCheck_feedback").attr("class","invalid-feedback");
				$("#pwCheck_feedback").html("비밀번호가 일치하지 않습니다.");
			}					
	});	
	
	/**
	 * 영문, 한글, 숫자 혼합 글자수 2~15자로 제한.
	 */
	$("#pwdans").blur(function() {
		var ansCheck = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/
		
		if( $("#pwdans").val() == "" || !ansCheck.test($("#pwdans").val()) ) {
			$("#pwdansDiv").attr("class", "form-group has-danger");
			$(this).attr("class","form-control is-invalid");
			$("#pwdans_feedback").attr("class","invalid-feedback");
			$("#pwdans_feedback").html("답변을 입력해주세요.");
		} else{
			$("#pwdansDiv").attr("class", "form-group has-success");
			$(this).attr("class","form-control is-valid");
			$("#pwdans_feedback").attr("class","valid-feedback");
			$("#pwdans_feedback").html("입력완료.");
			signup += '1';
		}
	});
	
	

	function result(){
		if(signup == '111111'){
			return true;
		}else{
			return false;
		}
	}


