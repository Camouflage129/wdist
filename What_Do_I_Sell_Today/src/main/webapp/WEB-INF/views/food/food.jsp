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

  <!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="span4">
					<div class="inner-heading">
						<h2>업종별 검색</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row">
			<br>
			<h2>키워드 분석</h2>
			<br>
			<table class="table table-bordered">
				<tbody>
					<tr class="title1">
						<td><button id="korea" class="btn btn-link">한식</button></td>
						<td><button id="japan" class="btn btn-link">일식</button></td>
						<td><button id="kimbap" class="btn btn-link">분식</button></td>
						<td><button id="chicken" class="btn btn-link">치킨</button></td>
						<td><button id="alchol" class="btn btn-link">호프</button></td>
					</tr>
					<tr class="title1">
						<td><button id="china" class="btn btn-link">중식</button></td>
						<td><button id="america" class="btn btn-link">양식</button></td>
						<td><button id="fastfood" class="btn btn-link">패스트푸드</button></td>
						<td><button id="cookies" class="btn btn-link">제과</button></td>
						<td><button id="coffee" class="btn btn-link">커피</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="foodModal" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">결과</h5>
					<button id="closeBtn" type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-8">
							<table class="table table-hover">
								<tr>
									<th>분기</th>
									<th>순위</th>
									<th>단어</th>
								</tr>
								<c:forEach var="data" items="${list}">
									<tr class="table-primary">
										<td>${data.quater}</td>
										<td>${data.rank}</td>
										<td>${data.word}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="col-sm-4">
							<img alt="wordcloud" src="/image/${wordcloud}.jpeg">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="closeBtn2" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
<a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
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



