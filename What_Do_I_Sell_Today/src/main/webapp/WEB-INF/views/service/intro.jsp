<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<title>오늘 뭐 팔지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

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
	<jsp:include page="../header.jsp"></jsp:include>
	<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="span4">
					<div class="inner-heading">
						<h2>상권 분석 서비스란?</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="content">
		<div class="container">
			<div class="row">
				<div class="jumbotron">

					<hr class="my-4">
					<p>우리는 서울시에서 보유한 공공데이터와 개인들이 페이스북, 인스타그램, 트위터와 같은 SNS 및 블로그에
						게재한 포스트들을 크롤링하여 수집한 데이터를 기반으로 상권을 분석하여 예비 자영업자들이나 현재 자영업자들에게 각종
						서비스를 제공합니다. 이를 토대로하여 자영업자들에게 최적의 입지와 업종 정보를 제공합니다.</p>

				</div>

				<hr class="my-4">

				<div class="img" align="center">
					<img src="./image/introImg.PNG">
				</div>

				<div class="jumbotron">
					<h2 class="display-6">상권 분석 서비스 안내</h2>
					<hr class="my-4">
					<p>우리는 맞춤형 상권 분석 서비스를 제공합니다. 제공하는 서비스는 다음과 같습니다. 업종별 및 지역별로 상권을
						분석하여 정보를 제공하며, 이 뿐만 아니라 매출랭킹 서비스와 성공 확률 예측 서비스까지 제공합니다. 공공데이터에 더해서
						SNS 해시태그(#) 트렌드를 분석한 서비스를 제공하기 때문에 한층 더 유망한 상권 정보를 제공합니다.</p>

					<hr class="my-4">


					<div class="list-group">
<!-- 						<a class="list-group-item list-group-item-action"
							style="color: black;">제공하는 서비스 </a><br> -->
						<h2 class="display-6">제공하는 서비스</h2>
						<hr class="my-4">
						<ul>
							<li><a href="/foodArea.do"
								class="list-group-item list-group-item-action">업종별 검색 </a></li>
							<li><a href="/areaFood.do"
								class="list-group-item list-group-item-action">지역별 검색 </a></li>
							<li><a href="index.jsp?content=WEB-INF/views/sale/sale.jsp"
								class="list-group-item list-group-item-action">매출 랭킹 </a></li>
							<li><a
								href="index.jsp?content=WEB-INF/views/success/success.jsp"
								class="list-group-item list-group-item-action">성공 확률 예측 </a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>