<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Menu</title>


</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container">
			<div class="col-sm-3"> </div>
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">	<!-- WEB-INF 있는 부분 나중에 .do로 실행시켜서 처리해야함. -->
					<li class="nav-item"><a class="nav-link" href="/foodArea.do">업종별 검색</a></li>
					<li class="nav-item"><a class="nav-link" href="/areaFood.do">지역별 검색</a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp?content=WEB-INF/views/sale/sale.jsp">매출 랭킹</a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp?content=WEB-INF/views/success/success.jsp">성공 확률 예측</a></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarColor01">
				<c:if test="${empty userid}">
					<a id="loginA" href="/login.do">로그인</a>&nbsp;|&nbsp;
					<a id="signUpA" href="/signUp.do">회원가입</a>
				</c:if>
				<c:if test="${!empty userid}">
					<a id="loginA" href="/logout.do">로그아웃</a>&nbsp;|&nbsp;
					<a id="modifyUser" href="userview.do">회원정보수정</a>
				</c:if>
				
			</div>
		</div>
	</nav>
</body>
</html>