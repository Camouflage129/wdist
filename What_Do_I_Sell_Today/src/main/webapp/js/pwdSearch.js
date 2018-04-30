$("#id5").blur(function() {
	if ($("#id5").val() == "") {
		$("#idDiv5").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#id_feedback5").attr("class", "invalid-feedback");
		$("#id_feedback5").html("공백은 입력하실 수 없습니다. ID를 입력해주세요.");
	} else if (!($("#id5").val()).match(/[0-9]|[a-z]|[A-Z]/)) {
		$("#idDiv5").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#id_feedback5").attr("class", "invalid-feedback");
		$("#id_feedback5").html("영문과 숫자만 사용해주세요.");
	} else {
		$("#idDiv5").attr("class", "form-group has-success");
		$(this).attr("class","form-control is-valid");
		$("#id_feedback5").attr("class", "valid-feedback");
		$("#id_feedback5").html("입력완료.");
	}
});


$("#name2").blur(function() {
	var han = /[가-힣]{2,}/;
	var name = $("#name2").val();

	if (name == "" || !han.test(name)) {
		$("#nameDiv2").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#name_feedback2").attr("class", "invalid-feedback");
		$("#name_feedback2").html("이름을 정확히 입력해주세요.");
	} else {
		$("#nameDiv2").attr("class", "form-group has-success");
		$(this).attr("class", "form-control is-valid");
		$("#name_feedback2").attr("class", "valid-feedback");
		$("#name_feedback2").html("입력완료.");
	}
});


$("#email2").blur(function() {
	var re = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var email = $("#email2").val();

	if (email == "" || !re.test(email)) {
		$("#emailDiv2").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#email_feedback2").attr("class", "invalid-feedback");
		$("#email_feedback2").html("Email을 정확히 입력해주세요.");
	} else {
		$("#emailDiv2").attr("class", "form-group has-success");
		$(this).attr("class", "form-control is-valid");
		$("#email_feedback2").attr("class", "valid-feedback");
		$("#email_feedback2").html("입력완료");
	}
});

$("#pwdans").blur(function() {
	var ansCheck = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/
	
	if( $("#pwdAnsDiv").val() == "" || !ansCheck.test($("#pwdans").val()) ) {
		$("#pwdAnsDiv").attr("class", "form-group has-danger");
		$(this).attr("class","form-control is-invalid");
		$("#pwdAns_feedback").attr("class","invalid-feedback");
		$("#pwdAns_feedback").html("답변을 입력해주세요.");
	} else{
		$("#pwdAnsDiv").attr("class", "form-group has-success");
		$(this).attr("class","form-control is-valid");
		$("#pwdAns_feedback").attr("class","valid-feedback");
		$("#pwdAns_feedback").html("입력완료.");
		signup += '1';
	}
});