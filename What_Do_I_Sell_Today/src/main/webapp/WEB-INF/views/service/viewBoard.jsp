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
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="ico/favicon.png" />
<link href="css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">


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

			<i class="fa fa-fw fa-user"></i> <span class="sr-only sound_only">작성자</span>
			<b>${board.usersID}</b>
			</li> <i class="fa fa-fw fa-calendar"></i> <span
				class="sr-only sound_only">작성일</span> <b>${board.postDate}</b> <i
				class="fas fa-comment"></i> <span class="sr-only sound_only">댓글</span>
			<b>댓글 ${repliesCount}건</b>

		</div>
		<input id="beforeNum" type="hidden" name="beforeNum"
			value="${afterNum}"> <input id="afterNum" type="hidden"
			name="afterNum" value="${beforeNum}"> <input id="boardNum"
			type="hidden" name="boardNum" value="${board.boardNum}">
		<div class="col-xs-12">
			<div class=row style="margin-bottom: 0px;margin-top: 20px;">
				<div class="col-md-9" style="padding-left: 30px;">
					<button id="beforePost" type="button" class="btn btn-theme">이전글</button>
					<button id="afterPost" type="button" class="btn btn-theme">다음글</button>
				</div>
				<div class="col-xs-1 pull-right"
					style="float: right; padding-left: 45px;">
					<c:if test="${userid == board.usersID}">
						<button id="editBtn" class="btn btn-green">수정</button>
						<button id="deleteBtn" class="btn btn-red link-btn">삭제</button>
					</c:if>
					<button type="button" onclick="location.href='${board.type}.do?num=1'"
						class="btn btn-blue">목록</button>
					<button type="button"
						onclick="location.href='insertBoardGo.do?type=${board.type}'"
						class="btn btn-theme">글쓰기</button>

				</div>
			</div>
			<div>
				<h2 id="bo_v_atc_title" class="sr-only">본문</h2>
				<div id="bo_v_con" class="col-xs-12 kor">
					<hr>
					${board.contents}
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<hr>
		<label for="content">comment</label>
		<div class="input-group">
			<input type="hidden" name="boardNum" value="${board.boardNum}" /> <input
				id="content" type="text" class="form-control" id="content"
				name="content" placeholder="내용을 입력하세요." style="padding-top: 0px;">
			<span class="input-group-btn">
				<button id="commentInsertBtn" class="btn btn-default" type="button">등록</button>
			</span>
		</div>
	</div>

	<div class="container">
		<hr>
		<div class="commentList"></div>
	</div>
	<jsp:include page="comment.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jcarousel/jquery.jcarousel.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/jquery.nivo.slider.js"></script>
	<script src="js/modernizr.custom.js"></script>
	<script src="js/jquery.ba-cond.min.js"></script>
	<script src="js/jquery.slitslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/viewBoard.js"></script>

	<!-- Template Custom JavaScript File -->
	<script src="js/custom.js"></script>
</body>
</html>