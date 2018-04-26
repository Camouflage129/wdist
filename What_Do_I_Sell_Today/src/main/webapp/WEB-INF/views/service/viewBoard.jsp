<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/ckeditor.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/style.css">
<script type="text/javascript" src="js/viewBoard.js"></script>
<title>View Board</title>
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
					class="sr-only sound_only">댓글</span> <b>댓글 ${repliesCount}건</b></li>
			</ul>
		</div>
		<input id="beforeNum" type="hidden" name="beforeNum"
			value="${afterNum}"> <input id="afterNum" type="hidden"
			name="afterNum" value="${beforeNum}"> <input id="boardNum"
			type="hidden" name="boardNum" value="${board.boardNum}">
		<div class="col-xs-12">
			<ul class="bo_v_nb list-inline pull-left hidden-xs">
				<li class="zero-padding"><button id="beforePost" type="button"
						class="btn btn-info">이전글</button></li>
				<li class="zero-padding"><button id="afterPost" type="button"
						class="btn btn-info">다음글</button></li>
			</ul>
			<ul class="bo_v_com list-inline pull-right">
				<c:if test="${userid == board.usersID}">
					<li class="zero-padding"><button id="editBtn" class="btn btn-default">수정</button></li>
					<li class="zero-padding"><button id="deleteBtn" class="btn btn-danger link-btn">삭제</button></li>
				</c:if>
				<li class="zero-padding"><a href="freeBoard.do?num=1"
					class="btn btn-default">목록</a></li>
				<li class="zero-padding"><a
					href="insertBoardGo.do?type=${board.type}"
					class="btn btn-primary link-btn">글쓰기</a></li>
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
	<div class="container">
		<hr>
		<label for="content">comment</label>
		<div class="input-group">
			<input type="hidden" name="boardNum" value="${board.boardNum}" /> <input
				id="content" type="text" class="form-control" id="content"
				name="content" placeholder="내용을 입력하세요."> <span
				class="input-group-btn">
				<button id="commentInsertBtn" class="btn btn-default" type="button">등록</button>
			</span>
		</div>
	</div>

	<div class="container">
		<hr>
		<div class="commentList"></div>
	</div>
	<%@ include file="comment.jsp"%>
</body>
</html>