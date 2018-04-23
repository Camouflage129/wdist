<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>새로운 비밀번호 설정</title>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">

</head>
<body>

<form action="/signUpNewPwd.do" method="post" id="searchpwdForm">
  <fieldset>
  <div align="center">
	<legend>비밀번호 변경하기</legend>
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
					
<!-- 		<div id="pwDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="pw" type="password" class="form-control is-invalid" name="pw">
			<div id="pw_feedback" class="pw_feedback">4~15글자 이내로 입력하셔야 가입이 가능합니다.</div>
		</div>

		<div id="pwCkDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="pw_Check" type="password" class="form-control is-invalid">
			<div id="pwCheck_feedback" class="pwCheck_feedback">다시한번 비밀번호를 입력해주세요.</div>
		</div>			 -->


	<div class="pwchkwrap">
                 <label for="qustPwd">Password Hint</label>
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

		
		<div id="nameDiv" class="form-group has-danger">
			<!-- <label class="form-control-label" for="inputDanger1">Name</label>  -->
			<input id="pwdhint" type="text" class="form-control is-invalid" name="pwdhint">
			<div id="ansPwd_feedback" class="ansPwd_feedback">질문에 대한 답변을 입력해주세요.</div>
		</div>

	
		<div class="form-group text-center">
			<button id="newPwdBtn" type="submit" class="btn btn-success">새비밀번호 설정</button>
			<button type="button" class="btn btn-warning">가입취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>





</body>
</html>