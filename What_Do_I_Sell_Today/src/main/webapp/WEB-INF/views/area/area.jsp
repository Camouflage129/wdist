<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Food</title>
</head>
<body>
	Food
</body>
</html>
  -->


<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- modal -->
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


	<div class="container">
		<!--  <h2>Large Modal</h2>
  Trigger the modal with a button
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>
 -->
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
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

</body>
</html>
