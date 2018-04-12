<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/signUp.js?ver=2"></script>
<title>SignUp</title>
</head>
<body>
<form>
  <fieldset>
  <div align="center">
	<legend>회원가입</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
		<div id="idDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">ID</label> 
			<input id="id" type="text" class="form-control is-invalid" >
			<div class="id_feedback"> ID를 입력해주세요.</div>
		</div>
		
		<div id="nameDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Name</label> 
			<input id="name" type="text" class="form-control is-invalid">
			<div class="name_feedback">이름을 입력해주세요.</div>
		</div>
			
		<div id="emailDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Email</label> 
			<input id="email" type="text" class="form-control is-invalid">
			<div class="email_feedback">이메일 주소를 입력해주세요.</div>
		</div>
					
		<div id="pwDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="pw" type="text" class="form-control is-invalid">
			<div class="pw_feedback">비밀번호를 입력해주세요.</div>
		</div>

		<div id="pwCkDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="pw_Check" type="text" class="form-control is-invalid">
			<div class="pwCheck_feedback">다시한번 비밀번호를 입력해주세요.</div>
		</div>			
	
		<div class="form-group text-center">
			<button id="signUpBtn" type="button" class="btn btn-success">회원가입</button>
			<button type="button" class="btn btn-warning">가입취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>
</body>
</html>


