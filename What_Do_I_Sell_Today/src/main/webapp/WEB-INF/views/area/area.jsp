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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- modal -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- table -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table, tr, td {
	text-align: center;
}




/* table td a {
	display: block;
	width: 100%;
	height: 100%;
} */
h2 {
	text-align: center;
}

h4 {
	text-align: center;
}

/* 	button{
  	background: none;
    color: inherit;
    border: none;
    padding: 0;
    font: inherit;
    cursor: pointer;
    outline: inherit;
  	} */
.btn.btn-info.btn-lg {
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	font: inherit;
	cursor: pointer;
	outline: inherit;
}

/* #table2{
  	width:80%;
  	margin-left: auto;
  	margin-right: auto;
  	}
  	 */
#salearea {
	float: left;
}

#dangerarea {
	float: left;
}
</style>

<script type="text/javascript">
	$(function() {
		var id;
		var idname;
		var classname;
		var title;
		var food;


		$('.btn.btn-info.btn-lg').click(function() {

			$.ajax({
				type : 'POST',
				url : 'areaFoodTitle.do',
				dataType : 'json',
				data : {
					"areatitle" : $(this).text()
				},
				success : function(data) {
					food = data;
					var length = $(".tr").find('td').length;

					if (length == 5 ) {
						return;
					} else {
						for (var i in food) {
							/* $(".modal-body").append('<td><a href="/menuDesc.do?food=' + food[i] + '\">' + food[i] + '</a></td>');*/
							$("#tr1").append('<td>'+food[i]+'</td>');							
 						}
					}

				},
				error : function(data) {
					alert("통신실패 : " + data.message);
				}
			}); //end ajax     

		});
	});
</script>
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

	<div id="modalsize" class="container">
		<!--  <h2>Large Modal</h2>
  Trigger the modal with a button
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>
 -->
		<!-- Modal -->
		
		<div class="modal fade" id="myModal" role="dialog">
		<div id="modal" class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
					<h4 class="modal-title">지역별 업종 분석</h4>
				</div>
				<div class="modal-body">
					<div id="salearea">
						업종별 매출액
						<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>1702~04</th>
									<th>1705~07</th>
									<th>1708~010</th>
									<th>17011~1801</th>
								</tr>
							</thead>
							<tbody>
								<tr id="tr1" class="tr">
									<td>분식집</td>
								</tr>
								<tr id="tr2" class="tr">
									<td>양식집</td>
								</tr>
								<tr id="tr3" class="tr">
									<td>일식</td>
								</tr>
								<tr id="tr4" class="tr">
									<td>제과점</td>
								</tr>
								<tr id="tr5" class="tr">
									<td>중국집</td>
								</tr>
								<tr id="tr6" class="tr">
									<td>치킨집</td>
								</tr>
								<tr id="tr7" class="tr">
									<td>커피</td>
								</tr>
								<tr id="tr8" class="tr">
									<td>패스트푸드</td>
								</tr>
								<tr id="tr9" class="tr">
									<td>한식</td>
								</tr>
								<tr id="tr10" class="tr">
									<td>호프집</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="dangerarea">창업위험도</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>


	<div class="container">
		<br>
		<h2>지역별 검색</h2>
		<br>
		<table class="table table-bordered">

			<tbody>
				<tr>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강남구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강동구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강북구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강서구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">관악구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">광진구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">구로구</button></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">금천구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">노원구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">도봉구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">동대문구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">동작구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">마포구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">서대문구</button></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">서초구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">성동구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">성북구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">송파구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">양천구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">영등포구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">용산구</button></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">은평구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">종로구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">도봉구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">중구</button></td>
					<td><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">중랑구</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>
