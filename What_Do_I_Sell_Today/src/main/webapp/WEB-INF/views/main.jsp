<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>main</title>
</head>
<body>
	<div style="background: black;">
		<div class="container">
			<div class="card img-fluid main">
				<img class="card-img-top mainImage" src="./image/main.png"
					alt="Card image">
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
						<a href="index.jsp?content=WEB-INF/views/service/intro.jsp"
							class="btn btn-primary float-lg-right">보러 가기</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card mb-3">
					<img style="height: 200px; width: 100%; display: block;"
						src="./image/card2.jpg" alt="Card image">
					<div class="card-body">
						<h5 class="card-title">자유게시판</h5>
						<a href="/freeBoard.do?num=1"
							class="btn btn-primary float-lg-right">보러 가기</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card mb-3">
					<img style="height: 200px; width: 100%; display: block;"
						src="./image/card3.png" alt="Card image">
					<div class="card-body">
						<h5 class="card-title">고객지원센터</h5>
						<a href="/csBoard.do" class="btn btn-primary float-lg-right">보러
							가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Button to Open the Modal -->
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id = "modaltitle">경고</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" id="modal-body"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<c:if test="${!empty resultMsg}">
		<script type="text/javascript">
			$("#modal-body").html(${resultMsg});
			$("#modaltitle").html("경고");
			$('#myModal').modal('show');
		</script>
	</c:if>

</body>
</html>