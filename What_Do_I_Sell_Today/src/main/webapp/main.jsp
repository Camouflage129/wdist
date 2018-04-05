<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>main</title>
</head>
<body>
<div style="background: black;">
	<div class="container">
		<div class="card img-fluid main">
			<img class="card-img-top mainImage" src="./image/main.png" alt="Card image">
			<div class="card-img-overlay">
				<h4 class="card-title">창업 알아보고계세요?</h4>
				<p class="card-text">빅데이터 분석을 통해 성공의 길로 안내합니다!</p>
			</div>
		</div>
	</div>
</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="card mb-3">
					<img style="height: 200px; width: 100%; display: block;"
						src="./image/card1.jpg" alt="Card image">
					<div class="card-body">
						<h5 class="card-title">우리의 서비스를 소개합니다.</h5>
						<a href="index.jsp?content=WEB-INF/views/service/intro.jsp" class="btn btn-primary float-lg-right">보러 가기</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card mb-3">
					<img style="height: 200px; width: 100%; display: block;"
						src="./image/card2.png" alt="Card image">
					<div class="card-body">
						<h5 class="card-title">메뉴 2</h5>
						<a href="index.jsp?content=WEB-INF/views/service/service2.jsp" class="btn btn-primary float-lg-right">보러 가기</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card mb-3">
					<img style="height: 200px; width: 100%; display: block;"
						src="./image/card3.jpg" alt="Card image">
					<div class="card-body">
						<h5 class="card-title">메뉴 3</h5>
						<a href="index.jsp?content=WEB-INF/views/service/service3.jsp" class="btn btn-primary float-lg-right">보러 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>