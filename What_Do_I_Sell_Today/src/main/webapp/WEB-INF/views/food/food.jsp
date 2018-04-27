<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="js/food.js"></script>
	<link rel="stylesheet" href="./css/food.css?ver=0" media="screen">
	<title>Food</title>
</head>
<body>
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
	<div class="modal" id="foodModal">
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
									<th>1 분기</th>
									<th>2 분기</th>
									<th>3 분기</th>
									<th>4 분기</th>
								</tr>
								<c:forEach var="data" items="${list}">
									<tr class="table-primary">
										<td>${data.one}</td>
										<td>${data.two}</td>
										<td>${data.three}</td>
										<td>${data.four}</td>
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
</body>
</html>