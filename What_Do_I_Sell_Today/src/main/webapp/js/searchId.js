$("#name").blur(function(){
	var han = /[가-힣]{2,}/;
	var name = $("#name").val() ; 
	
	if( name = "" || !han.test(name)){
		$("#nameDiv").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#name_feedback").attr("class", "invalid-feedback");
		$("#name_feedback").html("이름을 정확히 입력해주세요.");
	} else{
		$("#nameDiv").attr("class", "form-group has-success");
		$(this).attr("class","form-control is-valid");
		$("#name_feedback").attr("class", "valid-feedback");
		$("#name_feedback").html("입력완료");
	}
	});
		

$("#email").blur(function(){
	var re = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var email = $("#email").val();
	
	if( email == "" || !re.test(email)){
		$("#email").attr("class", "form-group has-danger");
		$(this).attr("class", "form-control is-invalid");
		$("#email_feedback").attr("class", "invalid-feedback");
		$("#email_feedback").html("Email 형식에 맞춰서 Email을 입력해주세요.")
	} else{
		$("#emailDiv").attr("class", "form-group has-success");
		$(this).attr("class", "form-control is-valid");
		$("#email_feedback").attr("class", "valid-feedback");
		$("#email_feedback").html("입력완료");
	}
});



















// ============================ 아래는 참조사항.

/*<div align="center">
<div class="col-md-6 col-md-offset-3" align="left">

	<div id="nameDiv" class="form-group has-danger">
		<label class="form-control-label" for="inputDanger1">Name</label>
		<input id="name" type="text" class="form-control is-invalid"
			name="name">
		<div id="name_feedback" class="name_feedback">이름을 입력해주세요.</div>
	</div>

	<div id="emailDiv" class="form-group has-danger">
		<label class="form-control-label" for="inputDanger1">Email</label>
		<input id="email" type="email" class="form-control is-invalid"
			name="email">
		<div id="email_feedback" class="email_feedback">이메일 주소를
			입력해주세요.</div>
	</div>*/