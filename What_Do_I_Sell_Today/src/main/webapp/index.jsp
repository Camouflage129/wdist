<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
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
					<a href="/index.jsp">
						<img class="logo" alt="오늘 뭐 팔지?" src="./image/logo.png">
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
					<input>
	<form>
		<fieldset>
			<legend>예시</legend>
			<div class="form-group row">
				<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="text" readonly="" class="form-control-plaintext"
						id="staticEmail" value="email@example.com">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter email"> <small
					id="emailHelp" class="form-text text-muted">We'll never
					share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" class="form-control" id="exampleInputPassword1"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label for="exampleSelect1">Example select</label> <select
					class="form-control" id="exampleSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleSelect2">Example multiple select</label> <select
					multiple="" class="form-control" id="exampleSelect2">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleTextarea">Example textarea</label>
				<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
			</div>
			
			
			
			<fieldset class="form-group">
				<legend>Radio buttons</legend>
				<div class="form-check">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="optionsRadios" id="optionsRadios1"
						value="option1" checked=""> Option one is this and that—be
						sure to include why it's great
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="optionsRadios" id="optionsRadios2"
						value="option2"> Option two can be something else and
						selecting it will deselect option one
					</label>
				</div>
				<div class="form-check disabled">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="optionsRadios" id="optionsRadios3"
						value="option3" disabled=""> Option three is disabled
					</label>
				</div>
			</fieldset>
			<fieldset class="form-group">
				<legend>Checkboxes</legend>
				<div class="form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" value="" checked="">
						Option one is this and that—be sure to include why it's great
					</label>
				</div>
				<div class="form-check disabled">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" value="" disabled="">
						Option two is disabled
					</label>
				</div>
			</fieldset>
			<button type="submit" class="btn btn-primary">Submit</button>
		</fieldset>
	</form>				</div>
				<div class="modal-footer">
					<button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
					<button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>