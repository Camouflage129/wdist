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
			
			<div class="form-group" align="center">
			  <div class="col-sm-6" align="left">
			  	<div class="row">
				  	<div class="col-md-10">
						<label class="col-form-label" for="inputDefault">ID</labvel> 
						<input id="id" type="text" class="form-control"
						placeholder="사용할 ID를 입력하세요." required="required" />
				  	</div>
				  	<div class="col-sm-4" style="position:absolute; right:0px; bottom:0px;">
					    <button id="id_checkBtn" type="button" class="btn btn-primary">ID중복확인</button>
				  	</div>
			  	</div>
			  </div>
			</div>

			<div class="form-group" align="center">
			  <div class="col-sm-6" align="left">
				<label class="col-form-label" for="inputDefault">Name</label> <input
					id="name" type="text" class="form-control"
					placeholder="예시) 홍길동">
			  </div>
			</div>

			<div class="form-group" align="center">
				<div class="col-sm-6" align="left">
					<label for="exampleInputPassword1" align="left">password</label> <input
						id="pw" type="password" class="form-control"
						placeholder="사용할 비밀번호를 입력해주세요." required="required" />
				</div>
			</div>
			
			<div class="form-group" align="center">
				<div class="col-sm-6" align="left">
					<label for="exampleInputPassword1" align="left">password check </label> <input
						id="pw_check" type="password" class="form-control"
						placeholder="비밀번호를 다시 한번 입력해주세요." required="required" />
				</div>
			</div>

			<div class="form-group" align="center">
				<div class="col-sm-6" align="left">
					<label for="exampleInputEmail1" align="center">Email address</label> 
					<input id="Email" type="email" class="form-control"
						aria-describedby="emailHelp" placeholder="Enter email"
						required="required" />
				</div>
			</div>
			
			<div align="center">
				<button id="signUpBtn" type="button" class="btn btn-outline-success">가입하기</button>
				<button id="backBtn" type="button" class="btn btn-outline-secondary">취소</button>
			</div>
			
		</fieldset>
	</form>
</body>
</html>