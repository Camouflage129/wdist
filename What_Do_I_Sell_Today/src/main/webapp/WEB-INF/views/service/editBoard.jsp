<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>

<script type="text/javascript" src="js/insertBoard.js"></script>
<title>글수정</title>
</head>
<body>
	<div class="container">
		<form id="editForm" action="editBoard.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>글수정</legend>
				<input id="type" type="hidden" name="Type" value="${type}">
				<input id="type" type="hidden" name="num" value="${num}">
				
				<div class="form-group">
					제목 : <input type="text" name="Title" class="form-control" id="inputDefault" value="${board.title }">
				</div>
				<div class="form-group">
					작성자 : <input type="text" name="UsersID" class="form-control" id="inputDefault" value="${userid}" readonly="readonly">
				</div>
				<form>
					<textarea name="Contents" id="editor1" rows="10" cols="80">
		                	${board.contents}
		            </textarea>
					<script>
		                CKEDITOR.replace( 'editor1' );
		            </script>
				</form>
				<div class="form-group"  style = "padding: 15px;">
					<button id="cancel" type="button" class="btn btn-danger float-lg-right">취소</button>
					<button id="submit" type="submit" class="btn btn-info float-lg-right">글쓰기</button>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>