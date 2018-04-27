<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="utf-8">
  <title>오늘 뭐 팔지?</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
  <link href="css/font-awesome.css" rel="stylesheet" />

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
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
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>