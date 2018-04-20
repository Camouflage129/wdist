<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- <script type="text/javascript" src="js/signUp.js?ver=2"></script>  -->

<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="js/index.js?ver=1"></script>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<title>SignUp</title>
</head>
<body>
<form action="/signUp.do" method="post" id="signForm">
  <fieldset>
  <div align="center">
	<legend>회원가입</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
		<div id="idDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id" type="text" class="form-control is-invalid" name="id" onblur="onblur_event()">
			<div id="id_feedback" class="id_feedback"> 첫글자는 영문, 4~16자 이내로 입력해주세요.</div>
		</div>
		
		<div id="nameDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Name</label> 
			<input id="name" type="text" class="form-control is-invalid" name="name">
			<div id="name_feedback" class="name_feedback">이름을 입력해주세요.</div>
		</div>
			
		<div id="emailDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Email</label> 
			<input id="email" type="email" class="form-control is-invalid" name="email">
			<div id="email_feedback" class="email_feedback">이메일 주소를 입력해주세요.</div>
		</div>
					
		<div id="pwDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="pw" type="password" class="form-control is-invalid" name="pw">
			<div id="pw_feedback" class="pw_feedback">4~15글자 이내로 입력하셔야 가입이 가능합니다.</div>
		</div>

		<div id="pwCkDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="pw_Check" type="password" class="form-control is-invalid">
			<div id="pwCheck_feedback" class="pwCheck_feedback">다시한번 비밀번호를 입력해주세요.</div>
		</div>			
	
		<div class="form-group text-center">
			<button id="signUpBtn" type="submit" class="btn btn-success">회원가입</button>
			<button type="button" class="btn btn-warning">가입취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>
<!-- 실제 서버로 전송되는 form -->
<form action="/signUp.do" method="post" id="hiddenForm">
    <fieldset>
        <input type="hidden" name="email" />
        <input type="hidden" name="id" />
        <input type="hidden" name="pw" />
        <input type="hidden" name="name" />
    </fieldset>
</form>
<script type="text/javascript" src="/js/signUp.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>
<script scr="/js/signUp.js"></script>


<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $pw = $("#hiddenForm input[name='pw']");
    var $name = $("#hiddenForm input[name='name']");
    var $id = $("#hiddenForm input[name='id']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#signForm").submit(function(e) {
        e.preventDefault();
 
        var email = $(this).find("#email").val();
        var pw = $(this).find("#pw").val();
        var shaPw = hex_sha512(pw).toString();
        var id = $(this).find("#id").val();
        var name = $(this).find("#name").val();
        $email.val(rsa.encrypt(email));
        $pw.val(rsa.encrypt(shaPw));
        $name.val(rsa.encrypt(name));
        $id.val(rsa.encrypt(id));
        $("#hiddenForm").submit();
    });
</script>
</body>
</html>


