<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- <script type="text/javascript" src="js/signUp.js?ver=2"></script>  -->
<script type="text/javascript" src="js/index.js?ver=1"></script>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/disabled.css">
<title>modifyUser</title>

<script language="JavaScript">
function userModify() {
	f.action= "updateuser.do";
	f.submit();
	alert('회원정보 수정이 완료되었습니다.')
}

function userRemove() {
	if (confirm('정말로 탈퇴 하시겠습니까?')) {
		f.action= "/removeuser.do";
		f.submit();
		alert('회원탈퇴가 성공적으로 처리되었습니다.')

	} else {
	}
	
	
}


</script>

</head>
<body>
<form action="/updateuser.do" method="post" id="modifyForm" name="f">
  <fieldset>
  <div align="center">
	<legend>회원 정보 수정</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
		<div id="idDiv" class="form-group has-success">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id" type="text" class="form-control is-invalid.disabled" name="id" value="${user.id }" disabled="disabled">
		</div>
		
		<div id="ModifyNameDiv" class="form-group has-success">
			<label class="form-control-label" for="inputDanger1">Name</label> 
			<input id="ModifyName" type="text" class="form-control is-valid" name="name" value="${user.name }">
			<small id="ModifyName_feedback" class="form-text text-muted"> 수정하시려면 이름을 입력해주세요.</small>
		</div>
			
		<div id="ModifyEmailDiv" class="form-group has-success">
			<label class="form-control-label" for="inputDanger1">Email</label> 
			<input id="ModifyEmail" type="text" class="form-control is-valid" name="email" value="${user.email }">
			<small id="ModifyEmail_feedback" class="form-text text-muted">수정하시려면 이메일 주소를 입력해주세요.</small>
		</div>
					
		<div id="ModifyPwDiv" class="form-group has-success">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="ModifyPw" type="text" class="form-control is-valid" name="pw">
			<small id=ModifyPw_feedback class="form-text text-muted">수정하시려면 비밀번호를 입력해주세요.</small>
		</div>

		<div id="ModifyPwCkDiv" class="form-group has-success">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="ModifyPw_Check" type="text" class="form-control is-valid">
			<small id="ModifyPwCheck_feedback" class="form-text text-muted">다시한번 비밀번호를 입력해주세요.</small>
		</div>			
	
		<div class="form-group text-center">
<!-- 			<button id="signUpBtn" type="submit" class="btn btn-success">회원가입</button> -->
<!--  			<button id="modifyUser" type="submit" class="btn btn-success">수정하기</button> -->
 			<button id="modifyUser" type="submit" class="btn btn-success" onclick="userModify()">수정하기</button>
<!-- 			<input type="button" value="수정" onClick="userModify()"> &nbsp; -->
 			<button id="removeUser" type="button" class="btn btn-danger" onclick="userRemove()">탈퇴하기</button>
<!-- 			<input type="button" value="회원탈퇴" onClick="userRemove()"> &nbsp; -->
			
		</div>
	</div>
	</div>
	</fieldset>
</form>
<!-- 실제 서버로 전송되는 form -->
<form action="/updateuser.do" method="post" id="hiddenForm">
    <fieldset>
        <input type="hidden" name="email" />
        <input type="hidden" name="id" />
        <input type="hidden" name="pw" />
        <input type="hidden" name="name" />
    </fieldset>
</form>
<script type="text/javascript" src="/js/userView.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>
 
<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $pw = $("#hiddenForm input[name='pw']");
    var $name = $("#hiddenForm input[name='name']");
    var $id = $("#hiddenForm input[name='id']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#modifyForm").submit(function(e) {
        e.preventDefault();
 
        var email = $(this).find("#email").val();
        var pw = $(this).find("#pw").val();
        var shaPw = hex_sha512(pw).toString();
        var id = $(this).find("#id").val();
        var name = $(this).find("#name").val();
        $email.val(rsa.encrypt(email));
        if(pw==''){
        	$pw.val('');
        }else{
        	$pw.val(rsa.encrypt(shaPw));
        }
        $name.val(rsa.encrypt(name));
        $id.val(rsa.encrypt(id));
        $("#hiddenForm").submit();
    });
</script>
</body>
</html>


