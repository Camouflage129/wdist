<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<script language="JavaScript">
function displayId(){
	modal
}


</script>

</head>
<body>

<div class="modal" id="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<form action="/searchId.do" method="post" id="searchIdForm">
  <fieldset>
  <div align="center">
	<legend>아이디 찾기</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
		
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


		

	
		<div class="form-group text-center">
			<button id="searchIdBtn" type="submit" class="btn btn-success">아이디 확인</button>
			<button type="button" class="btn btn-warning">가입취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>
<!-- 실제 서버로 전송되는 form -->
<form action="/searchId.do" method="post" id="hiddenForm">
    <fieldset>
        <input type="hidden" name="email" />
        <input type="hidden" name="name" />
    </fieldset>
</form>

<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
<script src="/js/sha.min.js"></script>


<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $name = $("#hiddenForm input[name='name']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#searchIdForm").submit(function(e) {
        e.preventDefault();
 
        var email = $(this).find("#email").val();
//        var id = $(this).find("#id").val();
        var name = $(this).find("#name").val();
        $email.val(rsa.encrypt(email));
        $name.val(rsa.encrypt(name));
 //       $id.val(rsa.encrypt(id));
        $("#hiddenForm").submit();
    });
</script>



</body>
</html>