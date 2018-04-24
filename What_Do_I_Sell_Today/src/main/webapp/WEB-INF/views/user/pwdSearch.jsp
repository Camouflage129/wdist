<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

<form action="/searchPwd.do" method="post" id="searchpwdForm">
  <fieldset>
  <div align="center">
	<legend>비밀번호 찾기</legend>
  </div>
    <div align="center">
  	<div class="col-md-6 col-md-offset-3" align="left">
  	
		<!-- <div id="idDiv5" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id5" type="text" class="form-control is-invalid" name="id5">
			<small id="id_feedback5" class="form-text text-muted">첫글자는 영문, 4~16자 이내로 입력해주세요.</small>
		</div> -->
<!--   <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
		<div id="idDiv5" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id5" type="text" class="form-control is-invalid" name="id5">
			<small id="id_feedback5" class="form-text text-muted">ID를 입력해주세요.</small>
		</div> -->
		<div id="idDiv5" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id5" type="text" class="form-control is-invalid" name="id5">
			<small id="id_feedback5" class="form-text text-muted">ID를 입력해주세요.</small>
		</div>
		<div id="nameDiv2" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Name</label> 
			<input id="name2" type="text" class="form-control is-invalid" name="name2">
			<small id="name_feedback2" class="form-text text-muted">이름을 입력해주세요.</small>
		</div>
 			
		<div id="emailDiv2" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Email</label> 
			<input id="email2" type="email" class="form-control is-invalid" name="email2">
			<small id="email_feedback2" class="form-text text-muted">이메일 주소를 입력해주세요.</small>
		</div>
		

	<div class="pwchkwrap">
                 <label for="qustpwd">Password Hint</label>
                     <select id="pwdhint" name="pwdhint" class="custom-select" title="비밀번호 찾기 질문 조회">
                       
							<option value="P01"> 첫째 자녀의 이름은?</option>
							<option value="P02"> 자신의 인생 좌우명은?</option>
							<option value="P03"> 가장 기억에 남는 선생님 성함은?</option>
							<option value="P04"> 다시 태어나면 하고 싶은 것은?</option>
							<option value="P05"> 가장 감명깊게 본 영화는?</option>
							<option value="P06"> 기억에 남는 추억의 장소는?</option>
							<option value="P07"> 인상 깊게 읽은 책 이름은?</option>
							<option value="P08"> 자신의 보물 제1호는??</option>
							<option value="P09"> 아버지의 성함은?</option>
							<option value="P11"> 내가 좋아하는 운동은?</option>
                     </select>
              </div>

		<div id="pwdAnsDiv" class="form-group has-danger">
			<!-- <label class="form-control-label" for="inputDanger1">Name</label>  -->
			<input id="pwdAns" type="text" class="form-control is-invalid" name="pwdans">
			<small id="pwdAns_feedback" class="form-text text-muted">질문에 대한 답변을 입력해주세요.</small>
		</div>

	
		<div class="form-group text-center">
			<button id="newPwdBtn" type="submit" class="btn btn-success">새비밀번호 설정</button>
			<button type="reset" class="btn btn-warning">입력취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>
<!-- 실제 서버로 전송되는 form -->
<form action="/searchPwd.do" method="post" id="hiddenForm">
    <fieldset>
        <input type="hidden" name="email" />
        <input type="hidden" name="id" />
        <input type="hidden" name="name" />
        <input type="hidden" name="pwdhint" />
        <input type="hidden" name="pwdans" />
    </fieldset>
</form>

<script type="text/javascript" src="/js/pwdSearch.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>


<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $pwdhint = $("#hiddenForm input[name='pwdhint']");
    var $pwdans = $("#hiddenForm input[name='pwdans']");
    var $name = $("#hiddenForm input[name='name']");
    var $id = $("#hiddenForm input[name='id']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#searchpwdForm").submit(function(e) {
        e.preventDefault();
 
        var email = $(this).find("#email").val();
        var pwdhint = $(this).find("#pwdhint").val();
        var pwdans = $(this).find("#pwdans").val();
        var id = $(this).find("#id").val();
        var name = $(this).find("#name").val();
        $email.val(rsa.encrypt(email));
        $pwdhint.val(rsa.encrypt(pwdhint));
        $pwdans.val(rsa.encrypt(pwdans));
        $name.val(rsa.encrypt(name));
        $id.val(rsa.encrypt(id));
        $("#hiddenForm").submit();
    });
</script>



</body>
</html>