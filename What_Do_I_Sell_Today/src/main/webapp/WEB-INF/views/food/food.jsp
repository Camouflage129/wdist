<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/food.js"></script>
<link rel="stylesheet" href="./css/food.css?ver=0" media="screen">

<title>Food</title>

<meta charset="utf-8">
<title>오늘 뭐 팔지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
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
<style>
table>tbody>tr>td {
	text-align: center;
}

td {
  text-align: center;
  vertical-align: middle;
}
#forpadding {
	/* padding-top : 2em; */
    padding-bottom: 3em;
}
.container{
	padding-bottom:0;
}
.subtitle{
	text-align:left;
	padding-left:4em;
}
 #table {
    width: 100%;
    border: 1px solid #444444;
  } 
  .mark{
  	text-align:right;
  }
#myModal{
	 width: max-content; 
}

h2 {
	text-align: center;
}
h3{
	text-align: center;
    margin-bottom: auto;
    padding-bottom: 0.5em;
    padding-top: 0.5em;
}
h4 {
	text-align: center;
}


.btn.btn-info.btn-lg {
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	font: inherit;
	cursor: pointer;
	outline: inherit;
}


#salearea {
	float: left;  
	/* padding-left: 4em;
    padding-right: 1em;  */
    width:30em;
}

#dangerarea {
	float: left; 
	padding-left: 4em;
	/*padding-right: 4em;*/ 
	/* width:10em;  */
}

</style>

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
	<div id="progressbar" class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="100" aria-valuemin="0"
			aria-valuemax="100" style="width: 75%"></div>
	</div>

	<div id="modalsize" class="container">
		 <div id="myModal" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="mySignupModalLabel" aria-hidden="true">
		<div id="modal" class="modal-dialog modal-lg" > 
			<div class="modal-content">
				<div class="modal-header">
					<!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
					<h4 id="myModalLabel"><strong id="wheregu"></strong></h4>
				</div>
				<div class="modal-body">
					<div id="salearea">
						<h4>키워드 분석</h4>
						<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>1사분기</th>
									<!-- 1702~04 -->
									<th>2사분기</th>
									<!-- 1705~07 -->
									<th>3사분기</th>
									<!-- 1708~010 -->
									<th>4사분기</th>
									<!-- 17011~1801 -->
								</tr>
							</thead>
							<tbody class="tbody">
								
							</tbody>
						</table>
					</div>
					<div id="dangerarea">
						<h4>WordCloud</h4>
						<div id="wordcloudImg" class="descmark">
						</div>
					</div>
				</div>		
			</div>
					<div class="modal-footer">
						<button id="close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					<!-- <div id="dangerarea">창업위험도</div> -->
				</div>
			</div>
		</div>
	<jsp:include page="../footer.jsp"></jsp:include>
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



