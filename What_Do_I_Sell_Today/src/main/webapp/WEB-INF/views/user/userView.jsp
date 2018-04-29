<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/signUp.js?ver=2"></script>
<script type="text/javascript" src="js/index.js?ver=1"></script>
<!-- <link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen"> -->
<link rel="stylesheet" href="./css/old_bootstrap.css" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/disabled.css">
<title>modifyUser</title>

<script language="JavaScript">

function userRemove() {
	if (confirm('정말로 탈퇴 하시겠습니까?')) {
		modifyForm.action= "/removeuser.do";
		modifyForm.submit();
		alert('회원탈퇴가 성공적으로 처리되었습니다.')

	} else {
	}
	
	
}


</script>

</head>
<body>
<form action="/updateuser.do" method="post" id="modifyForm" name="modifyForm">
  <fieldset>
  <br>
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
			<small id="ModifyName_feedback" class="form-text text-muted"> 수정하시려면 이름을 입력해주세요. </small>
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
		
		<div class="pwchkwrap">
			<label for="qustPwd">Password Hint</label> 
			<select id="pwdhint" name="pwdhint" class="custom-select" title="비밀번호 찾기 질문 조회">
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
		</div>

		<div id="pwdansDiv2" class="form-group has-danger">
		<!-- <label class="form-control-label" for="inputDanger1">Name</label>  -->
			<input id="pwdans" type="text" class="form-control is-valid"	name="pwdans">
			<small id="pwdans_feedback2" class="ansPwd_feedback">답변을 수정하시려면 다시 입력해주세요.</small>
		</div>
			
		<br><br>
		<div class="form-group text-center">
 			<button id="modifyUser" type="submit" class="btn btn-success">수정하기</button>
 			<button id="removeUser" type="button" class="btn btn-danger" onclick="userRemove()">탈퇴하기</button>
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
        <input type="hidden" name="pwdhint" />
        <input type="hidden" name="pwdans" /> 
    </fieldset>
</form>
<script type="text/javascript" src="/js/userView.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>
 

<script>

/**
 * 사용자 아이디에 따른 select option 초깃값
 */
$(document).ready(function(){
  $("select option[value='${user.pwdhint}']").attr("selected", true);
  $("#pwdans").val('${user.pwdans}');
  
});






/*  유저 입력 form의 submit event 재정의  */
 
    var $email = $("#hiddenForm input[name='email']");
    var $pw = $("#hiddenForm input[name='pw']");
    var $name = $("#hiddenForm input[name='name']");
    var $id = $("#hiddenForm input[name='id']");    
    var $pwdhint = $("#hiddenForm input[name='pwdhint']");
    var $pwdans = $("#hiddenForm input[name='pwdans']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    
    $("#modifyForm").submit(function(e) {
		e.preventDefault();
    	if(result()) {
            
            var email = $(this).find("#ModifyEmail").val();
            alert('oemail'+email);
            var pw = $(this).find("#ModifyPw").val();
            if(pw!=undefined){
            	var shaPw = hex_sha512(pw).toString();	
            }
            
            var id = $(this).find("#id").val();
            var name = $(this).find("#ModifyName").val();
            
            if(pw==undefined){
            	$pw.val('');
            }else{
            	$pw.val(rsa.encrypt(shaPw));
            }
            
            var pwdhint = $(this).find("#pwdhint").val();
            var pwdans = $(this).find("#pwdans").val();
            
            $email.val(rsa.encrypt(email));
            $name.val(rsa.encrypt(name));
            $id.val(rsa.encrypt(id));
            $pwdhint.val(rsa.encrypt(pwdhint));
            $pwdans.val(rsa.encrypt(pwdans));
            alert('pwdhint : ' +$pwdhint.val());
            alert('pwdans : '+$pwdans.val());
            
            $("#hiddenForm").submit();
    	} else {
    		alert('error');
    	}
    	

    	
    });
</script>
</body>
</html>


