<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/TestLogin.do" method="post" id="loginForm">
    <fieldset>
        <legend class="screen_out">로그인 폼</legend>
 
        <label for="email">이메일</label>
        <input type="text" id="email" name="email" autofocus autocomplete="off" required />
 
        <label for="pw">비밀번호</label>
        <input type="password" id="pw" name="pw" autocomplete="off" required />
 
        <button type="submit">
            <i class="fa fa-sign-in"></i> 로그인
        </button>
    </fieldset>
</form>
 
<!-- 실제 서버로 전송되는 form -->
<form action="/TestLogin.do" method="post" id="hiddenForm">
    <fieldset>
        <input type="hidden" name="email" />
        <input type="hidden" name="pw" />
    </fieldset>
</form>
 
<!-- javascript lib load -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 
<!-- 유저 입력 form의 submit event 재정의 -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $pw = $("#hiddenForm input[name='pw']");
 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#loginForm").submit(function(e) {
        // 실제 유저 입력 form은 event 취소
        // javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
        // -> Server 측에서 검증되므로 로그인 불가
        e.preventDefault();
 
        // 아이디/비밀번호 암호화 후 hidden form으로 submit
        var email = $(this).find("#email").val();
        var pw = $(this).find("#pw").val();
        $email.val(rsa.encrypt(email)); // 아이디 암호화
        $pw.val(rsa.encrypt(pw)); // 비밀번호 암호화
        $("#hiddenForm").submit();
    });
</script>


</body>
</html>