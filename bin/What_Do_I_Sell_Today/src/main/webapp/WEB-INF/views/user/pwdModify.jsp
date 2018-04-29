<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

<form action="/signUpNewPwd.do" method="post" id="searchpwdForm">
  <fieldset>
  <div align="center">
	<legend>����й�ȣ �����ϱ�</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
					
		<div id="pwDiv3" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="pw3" type="password" class="form-control is-invalid" name="pw">
			<small id="pw_feedback3" class="form-text text-muted">4~15���� �̳��� �Է����ּ���.</small>
		</div>

		<div id="pwCkDiv3" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="pw_Check3" type="password" class="form-control is-invalid">
			<small id="pwCheck_feedback3" class="form-text text-muted">�ٽ��ѹ� ��й�ȣ�� �Է����ּ���.</small>
		</div>			


	
		<div class="form-group text-center">
			<button id="newPwdBtn" type="submit" class="btn btn-success">����й�ȣ ����</button>
			<button type="button" class="btn btn-warning">�������</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>

<!-- ���� ������ ���۵Ǵ� form -->
<form action="/signUpNewPwd.do" method="post" id="hiddenForm">
    <fieldset>

        <input type="hidden" name="pw" />

    </fieldset>
</form>

<script type="text/javascript" src="/js/pwdModify.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>



<!-- ���� �Է� form�� submit event ������ -->
<script>

    var $pw = $("#hiddenForm input[name='pw']");


 
    // Server�κ��� ���� ����Ű �Է�
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#searchpwdForm").submit(function(e) {
        e.preventDefault();
 

        var pw = $(this).find("#pw").val();
		var shaPw = hex_sha512($('#pw').val()).toString();
        $pw.val(rsa.encrypt(shaPw));
        $("#hiddenForm").submit();
    });
</script>



</body>
</html>