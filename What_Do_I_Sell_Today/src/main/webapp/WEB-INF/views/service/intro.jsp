<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Introduce</title>

<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
</head>
<body>

	<div class="jumbotron">
		<h1 class="display-6">상권 분석 서비스란?</h1>

		<hr class="my-4">
		<p>우리는 서울시에서 보유한 공공데이터와 개인들이 페이스북, 인스타그램, 트위터와 같은 SNS 및 블로그에 게재한
			포스트들을 크롤링하여 수집한 데이터를 기반으로 상권을 분석하여 예비 자영업자들이나 현재 자영업자들에게 각종 서비스를
			제공합니다. 이를 토대로하여 자영업자들에게 최적의 입지와 업종 정보를 제공합니다.</p>

	</div>

	<hr class="my-4">

	<div class="img" align="center">
		<img src="./image/introImg.PNG">
	</div>

	<div class="jumbotron">
		<h1 class="display-6">상권 분석 서비스 안내</h1>
		<hr class="my-4">
		<p>우리는 맞춤형 상권 분석 서비스를 제공합니다. 제공하는 서비스는 다음과 같습니다. 업종별 및 지역별로 상권을
			분석하여 정보를 제공하며, 이 뿐만 아니라 매출랭킹 서비스와 성공 확률 예측 서비스까지 제공합니다. 공공데이터에 더해서
			SNS 해시태그(#) 트렌드를 분석한 서비스를 제공하기 때문에 한층 더 유망한 상권 정보를 제공합니다.</p>

		<hr class="my-4">


		<div class="list-group">
			<a class="list-group-item list-group-item-action active" style="color: white;">제공하는 서비스 </a> 
			<a href="/foodArea.do" class="list-group-item list-group-item-action">업종별 검색 </a> 
			<a href="/areaFood.do" class="list-group-item list-group-item-action">지역별 	검색 </a> 
			<a href="index.jsp?content=WEB-INF/views/sale/sale.jsp" class="list-group-item list-group-item-action">매출 랭킹 </a> 
			<a href="index.jsp?content=WEB-INF/views/success/success.jsp" class="list-group-item list-group-item-action">성공 확률 예측 </a> 
		</div>

	</div>


</body>
</html>