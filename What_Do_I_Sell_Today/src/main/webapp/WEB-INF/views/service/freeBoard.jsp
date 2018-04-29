<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<title>오늘 뭐 팔지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<!-- css -->
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

<!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>

	<div id="wrapper">
		<!-- toggle top area -->

		<!-- end toggle top area -->
		<!-- start header -->
		<jsp:include page="../header.jsp"></jsp:include>
		<!-- end header -->
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>자유 게시판</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">

			<div class="container col-sm-11.5">
				<div class="row">
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="${postnum + 1}" />
							<c:forEach var="board" items="${list}">
								<c:set var="count" value="${count - 1}" />
								<tr>
									<th scope="row">${count}</th>
									<td><a href="findBoard.do?num=${board.boardNum}">${board.title}</a></td>
									<td>${board.usersID}</td>
									<td>${board.postDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-sm-1"></div>
				</div>
				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#">Prev</a></li>
						<c:forEach var="i" begin="1" end="${pageNum}" step="1">
							<c:if test="${thispage eq i}">
								<li class="active"><a href="freeBoard.do?num=${i}">${i}</a></li>
							</c:if>
							<c:if test="${thispage ne i}">
								<li><a href="freeBoard.do?num=${i}">${i}</a></li>
							</c:if>
							<c:if test="${i eq pageNum}">
								<c:if test="${thispage eq pageNum}">
									<li class=disabled><a href="#">Next</a></li>		
								</c:if>
								<c:if test="${thispage ne pageNum}">
									<li><a href="freeBoard.do?num=${pageNum+1}">Next</a></li>		
								</c:if>
							</c:if>
						</c:forEach>
						
					</ul>
				</div>
				
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<form action="searchBoard.do" method="post">
							<input type="hidden" name="num" value="1"> <input
								id="type" type="hidden" name="Type" value="${type}">
							<div class="col-xs-8 col-xs-offset-2">
								<div class="row">
									<div>
										<form action="" class="search-form">
											<div class="form-group has-feedback">
												<label for="search" class="sr-only">Search</label> <input
													type="text" class="form-control" name="search" id="search"
													placeholder="search"> <span
													class="glyphicon glyphicon-search form-control-feedback"></span>
											</div>
										</form>
									</div>
								</div>
								<!-- <div class="form-group">
								<div class="row">
									<div class="">
										<select id="searchTitle" name="searchTitle"
											class="custom-select input-sm">
											<option value="Title">제목</option>
											<option value="Contents">내용</option>
											<option value="UsersID">작성자</option>
										</select>
									</div>
									<div>
										<input type="text" name="text" class="form-control"
											placeholder="게시글 검색" id="searchBoard">
									</div>
									<div>
										<button type="submit" class="btn btn-primary">검색</button>
									</div>
								</div>
							</div> -->
						</form>
					</div>
					<div class="col-sm-1">
						<button id="insertBoard" type="button" class="btn btn-info">글쓰기</button>
					</div>
				</div>
			</div>
			<!-- end slider -->
		</section>


		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
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

	<!-- Template Custom JavaScript File -->
	<script src="js/custom.js"></script>

</body>
</html>
