<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/style.css">
<title>View Board</title>
<script type="text/javascript">
function delete() {
	$.ajax({
		url : '/recapcha.do',
		type : 'post',
		data : {
			recaptcha : document.getElementById("g-recaptcha-response").value
		},
		success : function(data) {
			var id = $('#old_id').val();
			var pw = $('#old_pw').val();
			var shaPw = hex_sha512($('#old_pw').val()).toString();
			if(data.result=='success'){
			// 아이디/비밀번호 암호화 후 hidden form으로 submit
			$id.val(rsa.encrypt(id)); // 아이디 암호화
			$pw.val(rsa.encrypt(shaPw)); // 비밀번호 암호화
			
			$("#hiddenForm").submit();
			}else{
				alert('자동가입방지 확인해주세요.');
			}
		},
		error : function() {
            alert("에러발생");
      }

	});
}
</script>
	
</head>
<body>
	<div class="container">
	<div class="col-xs-12">
        <h4 id="bo_v_title">
            <b>${board.title }</b>
        </h4>
    </div>
	<div class="col-xs-12">
		<ul class="list-inline">
			<li><i class="fa fa-fw fa-user"></i> <span
				class="sr-only sound_only">작성자</span> <b>${board.usersID}</b></li>
			<li><i class="fa fa-fw fa-calendar"></i> <span
				class="sr-only sound_only">작성일</span> <b>${board.postDate}</b></li>
			<li><i class="fa fa-fw fa-comments-o"></i> <span
				class="sr-only sound_only">댓글</span> <b>댓글 x건</b></li>
		</ul>
	</div>
	<div class="col-xs-12">
		<ul class="bo_v_nb list-inline pull-left hidden-xs">
			<li class="zero-padding"><a href="뭐를 넣을까요?"
				class="btn btn-default">이전글</a></li>
			<li class="zero-padding"><a href="뭐를 넣을까요?"
				class="btn btn-default">다음글</a></li>
		</ul>
		<ul class="bo_v_com list-inline pull-right">
            <li class="zero-padding"><a href="링크" class="btn btn-default">수정</a></li>
            <li class="zero-padding"><a href="deleteBoard.do?num=${board.boardNum }" class="btn btn-danger link-btn">삭제</a></li>
            <li class="zero-padding"><a href="링크" class="btn btn-default">검색</a></li>
            <li class="zero-padding"><a href="링크" class="btn btn-default">목록</a></li>
            <li class="zero-padding"><a href="링크" class="btn btn-primary link-btn">글쓰기</a></li>
        </ul>
		
	</div>
		
		<div>
		
			<h2 id="bo_v_atc_title" class="sr-only">본문</h2>
	
        <div id="bo_v_con" class="col-xs-12 kor">
        <hr>
        	${board.contents}
        </div>

    </div>
    </div>
</body>
</html>