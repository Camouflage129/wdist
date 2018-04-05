<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="js/index.js?ver=1"></script>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<title>오늘 뭐 팔지?</title>
</head>
<body>
	<div class="row">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<a href="/index.jsp"> <img class="logo" alt="오늘 뭐 팔지?"
						src="./image/logo.png">
					</a>
				</div>
				<div class="col-sm-4"></div>
				<div class="col-sm-4"></div>
			</div>
		</div>
	</div>

	<jsp:include page="menu.jsp" />

	<c:choose>
		<c:when test="${!empty content }">
			<jsp:include page="${content}" />
		</c:when>
		<c:when test="${param.content != null }">
			<jsp:include page="${param.content}" />
		</c:when>
		<c:otherwise>
			<jsp:include page="main.jsp" />
		</c:otherwise>
	</c:choose>

	<hr>
	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>

	<div id="loginModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Login</h5>
				</div>
				<div class="modal-body">
				
				<!-- 부트스트랩 로그인창 -->
					<div class="form-group">
						<fieldset>
							<label class="control-label" for="readOnlyInput">Readonly
								input</label> <input class="form-control" id="readOnlyInput" type="text"
								placeholder="Readonly input here…" readonly="">
						</fieldset>
					</div>

					<div class="form-group has-success">
						<label class="form-control-label" for="inputSuccess1">유효한
							입력</label> <input type="text" value="" class="form-control is-valid"
							id="inputValid" autofocus placeholder="ID 입력">
						<div class="valid-feedback">Success! You've done it.</div>
					</div>

					<div class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">유효하지
							않은 입력1</label> <input type="text" value=""
							class="form-control is-invalid" id="inputInvalid" autofocus
							placeholder="Password">
						<div class="invalid-feedback">Sorry, that username's taken.
							Try another?</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
					<button type="button" id="closeBtn" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>