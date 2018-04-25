<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="js/index.js?ver=1"></script>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
						<!-- <input id="id" type="text" class="form-control is-invalid" name="id" onblur="onblur_event()"> -->
						<input id="id" type="text" class="form-control is-invalid"
							name="id"> <small id="id_feedback"
							class="form-text text-muted">첫글자는 영문, 4~16자 이내로 입력해주세요.</small>
					</div>

					<div id="nameDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Name</label>
						<input id="name" type="text" class="form-control is-invalid"
							name="name"> <small id="name_feedback"
							class="form-text text-muted"> 이름을 2자 이상 입력해주세요.</small>
					</div>

					<div id="emailDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Email</label>
						<input id="email" type="email" class="form-control is-invalid"
							name="email"> <small id="email_feedback"
							class="form-text text-muted">형식) abcde1@gmail.com</small>
					</div>

					<div id="pwDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Password</label>
						<input id="pw" type="password" class="form-control is-invalid"
							name="pw"> <small id="pw_feedback"
							class="form-text text-muted">영문, 숫자를 포함해서 4~15글자 이내로
							입력해주세요.</small>
					</div>

					<div id="pwCkDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Password
							Check</label> <input id="pw_Check" type="password"
							class="form-control is-invalid"> <small
							id="pwCheck_feedback" class="form-text text-muted">다시한번
							비밀번호를 입력해주세요.</small>
					</div>


					<div class="pwchkwrap">
						<label for="qustPwd">Password Hint</label> <select id="pwdhint"
							name="pwdhint" class="custom-select" title="비밀번호 찾기 질문 조회">
							<option value="P01">첫째 자녀의 이름은?</option>
							<option value="P02">자신의 인생 좌우명은?</option>
							<option value="P03">가장 기억에 남는 선생님 성함은?</option>
							<option value="P04">다시 태어나면 하고 싶은 것은?</option>
							<option value="P05">가장 감명깊게 본 영화는?</option>
							<option value="P06">기억에 남는 추억의 장소는?</option>
							<option value="P07">인상 깊게 읽은 책 이름은?</option>
							<option value="P08">자신의 보물 제1호는??</option>
							<option value="P09">아버지의 성함은?</option>
							<option value="P11">내가 좋아하는 운동은?</option>
						</select>
					</div>

					<div id="pwdansDiv" class="form-group has-danger">
						<input id="pwdans" type="text" class="form-control is-invalid"
							name="pwdans">
						<div id="pwdans_feedback" class="ansPwd_feedback">질문에 대한 답변을
							입력해주세요.</div>
					</div>


					<div class="form-group text-center">
						<button id="signUpBtn" type="button" class="btn btn-success"
							onclick="signUp()">회원가입</button>
						<button type="reset" class="btn btn-warning">입력취소</button>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
	<!-- 실제 서버로 전송되는 form -->
	<form action="/signUp.do" method="post" id="hiddenForm">
		<fieldset>
			<input type="hidden" name="email" /> <input type="hidden" name="id" />
			<input type="hidden" name="pw" /> <input type="hidden" name="name" />
			<input type="hidden" name="pwdhint" /> <input type="hidden"
				name="pwdans" />
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
 	var $pwdhint = $("#hiddenForm input[name='pwdhint']");
 	var $pwdans = $("#hiddenForm input[name='pwdans']");
// 	var $pwCheack = $("#hiddenForm input[name='pw_Check']");
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
    
	function signUp() {
		if(result()){
		 	var email = $('#email').val();
	        var pw = $('#pw').val();
	        var shaPw = hex_sha512(pw).toString();
	        var id = $('#id').val();
	        var name = $('#name').val();
	        var pwdhint = $('#pwdhint').val();
	        var pwdans = $('#pwdans').val();
	        $email.val(rsa.encrypt(email));
	        $pw.val(rsa.encrypt(shaPw));
	        $name.val(rsa.encrypt(name));
	        $id.val(rsa.encrypt(id));
	        $pwdhint.val(rsa.encrypt(pwdhint));
	        $pwdans.val(rsa.encrypt(pwdans));
	        var formData = $("#hiddenForm").serialize();
		
	$.ajax({
		url : '/signUp.do',
		type : 'post',
		data : formData,
		success : function(data) {
			if(data == 'success'){
				alert('회원가입이 완료되었습니다.');
				location.href="login.do";
			} else{
				alert('회원가입에 실패했습니다.');
			}			
		},
		error : function() {
            alert("에러발생");
      }
	});

		}else{
			return;
		}
	}
		 	
    
	
	
</script>
</body>
</html>


