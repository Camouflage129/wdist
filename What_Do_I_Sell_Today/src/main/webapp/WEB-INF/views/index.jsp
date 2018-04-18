<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="js/index.js?ver=1"></script>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<link rel="stylesheet" href="./css/index.css?ver=0" media="screen">
<title>오늘 뭐 팔지?</title>
</head>
<body>
	<div class="row">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<a href="/index.jsp"> <img class="logo" alt="오늘 뭐 팔지?"
						src="./image/logo.png">
					</a>
				</div>
				<div class="col-sm-4"></div>
				<div class="col-sm-4"></div>
			</div>
		</div>
	</div>

	<jsp:include page="menu.jsp" />

	<c:choose>
		<c:when test="${!empty content }">
			<jsp:include page="${content}" />
		</c:when>
		<c:when test="${param.content != null }">
			<jsp:include page="${param.content}" />
		</c:when>
		<c:otherwise>
			<jsp:include page="main.jsp" />
		</c:otherwise>
	</c:choose>

	<hr>
	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>