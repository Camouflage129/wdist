var $email = $("#hiddenForm input[name='email']");
var $pw = $("#hiddenForm input[name='pw']");
var $id = $("#hiddenForm input[name='id']");
var $name = $("#hiddenForm input[name='name']");

// Server로부터 받은 공개키 입력
var rsa = new RSAKey();
rsa.setPublic("${modulus}", "${exponent}");

$("#signForm").submit(function(e) {
	// 실제 유저 입력 form은 event 취소
	// javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
	// -> Server 측에서 검증되므로 로그인 불가
	e.preventDefault();

	// 아이디/비밀번호 암호화 후 hidden form으로 submit
	var id = $(this).find("#id").val();
	var pw = $(this).find("#pw").val();
	var name = $(this).find("#name").val();
	var email = $(this).find("#email").val();
	$email.val(rsa.encrypt(email));
	$pw.val(rsa.encrypt(pw));
	$name.val(rsa.encrypt(name));
	$id.val(rsa.encrypt(id));
	
	$("#hiddenForm").submit();
});