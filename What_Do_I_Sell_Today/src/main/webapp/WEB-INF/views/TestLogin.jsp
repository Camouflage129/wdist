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
        <legend class="screen_out">�α��� ��</legend>
 
        <label for="email">�̸���</label>
        <input type="text" id="email" name="email" autofocus autocomplete="off" required />
 
        <label for="pw">��й�ȣ</label>
        <input type="password" id="pw" name="pw" autocomplete="off" required />
 
        <button type="submit">
            <i class="fa fa-sign-in"></i> �α���
        </button>
    </fieldset>
</form>
 
<!-- ���� ������ ���۵Ǵ� form -->
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
 
<!-- ���� �Է� form�� submit event ������ -->
<script>
    var $email = $("#hiddenForm input[name='email']");
    var $pw = $("#hiddenForm input[name='pw']");
 
    // Server�κ��� ���� ����Ű �Է�
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#loginForm").submit(function(e) {
        // ���� ���� �Է� form�� event ���
        // javascript�� �۵����� �ʴ� ȯ�濡���� ���� �Է� form�� submit ��
        // -> Server ������ �����ǹǷ� �α��� �Ұ�
        e.preventDefault();
 
        // ���̵�/��й�ȣ ��ȣȭ �� hidden form���� submit
        var email = $(this).find("#email").val();
        var pw = $(this).find("#pw").val();
        $email.val(rsa.encrypt(email)); // ���̵� ��ȣȭ
        $pw.val(rsa.encrypt(pw)); // ��й�ȣ ��ȣȭ
        $("#hiddenForm").submit();
    });
</script>


</body>
</html>