<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<title>Insert Board</title>
</head>
<body>
<div class="container">
		<form action="insertBoard.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>글쓰기</legend>
				<div class="form-group">
					제목 : <input type="text" name="title" class="form-control" id="inputDefault">
				</div>
				<div class="form-group">
					작성자 : <input type="text" name="name" class="form-control" id="inputDefault" value="${login.UsersID}" readonly="readonly">
				</div>
				<form>
		            <textarea name="editor1" id="editor1" rows="10" cols="80">
		                	게시글을 입력해주세요.
		            </textarea>
		            <script>
		                CKEDITOR.replace( 'editor1' );
		            </script>
		        </form>
				<div class="form-group">
					<button id="cancel" type="button" class="btn btn-danger float-lg-right">취소</button>				
					<button type="submit" class="btn btn-info float-lg-right">글쓰기</button>
				</div>
			</fieldset>
		</form>
</div>
</body>
</html>