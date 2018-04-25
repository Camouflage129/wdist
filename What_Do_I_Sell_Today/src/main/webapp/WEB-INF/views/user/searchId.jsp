<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>

<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



<script language="JavaScript">
	function findid() {
		$('#myModal').modal('show');
	 $.ajax({
		url : '/searchId.do',
		type : 'post',
		data : {
			name : $("#name").val(),
			email : $("#email").val(),
		},
		success : function(data) {
			var obj = JSON.parse(data);
			if(obj.result=='fail'){
				$("#modal-body").html("일치하는 정보가 없습니다.");
			}else{
				$("#modal-body").html("ID는 "+obj.result+"입니다.");
			}
			$('#myModal').modal('show');						
		},
		error : function() {
	            alert("에러발생");
	      }

	});
	}
	
	function gologin(){
		location.href="login.do"
	}
	
</script>

</head>
<body>

 <!-- Button to Open the Modal -->
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기 결과</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id = "modal-body">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="gologin()">로그인 하기</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
		<fieldset>
			<div align="center">
				<legend>아이디 찾기</legend>
			</div>
			<div align="center">
				<div class="col-md-6 col-md-offset-3" align="left">

					<div id="nameDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Name</label>
						<input id="name" type="text" class="form-control is-invalid"
							name="name">
						<div id="name_feedback" class="name_feedback">이름을 입력해주세요.</div>
					</div>

					<div id="emailDiv" class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">Email</label>
						<input id="email" type="email" class="form-control is-invalid"
							name="email">
						<div id="email_feedback" class="email_feedback">이메일 주소를
							입력해주세요.</div>
					</div>





					<div class="form-group text-center">
						<button id="searchIdBtn" type="button" class="btn btn-success"
							onclick="findid()">아이디 확인</button>
						<button type="button" class="btn btn-warning" onclick="gologin()">돌아가기</button>
					</div>
				</div>
			</div>
		</fieldset>
  
	
</body>
</html>