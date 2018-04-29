<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="utf-8">
  <title>오늘 뭐 팔지?</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
  <link href="css/font-awesome.css" rel="stylesheet" />

  <!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<style>
table>tbody>tr>td {
	text-align: center;
}

td {
  text-align: center;
  vertical-align: middle;
}
#forpadding {
	padding-top : 2em;
    padding-bottom: 3em;
}
 #table {
    width: 100%;
    border: 1px solid #444444;
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
	padding-left: 4em;
    padding-right: 1em;
}

#dangerarea {
	float: left;
	padding-left: 4em;
	padding-right: 4em;
}
</style>

<script type="text/javascript">
	$(function() {
		var id;
		var idname;
		var classname;
		var title;
		var food;
		var list;
		var danger;

		$('.btn.btn-info.btn-lg').click(function() {

			$.ajax({
				type : 'POST',
				url : 'areaFoodTitle.do',
				dataType : 'json',
				data : {
					"areatitle" : $(this).text()
				},
				success : function(data) {
					
					for (var i = 0; i<data.list1.length;i++) {
						var plus = i+1;
						/* alert(data.list1[i].asale); */
						$('#a'+plus).html(data.list1[i].asale);
					}
					for (var i = 0; i<data.list2.length;i++) {
						var plus = i+1;
						$('#b'+plus).html(data.list2[i].asale);
					}
					for (var i = 0; i<data.list3.length;i++) {
						var plus = i+1;
						$('#c'+plus).html(data.list3[i].asale);
					}
					for (var i = 0; i<data.list4.length;i++) {
						var plus = i+1;
						$('#d'+plus).html(data.list4[i].asale);
					}
					var da = data.danger
					var obj = JSON.parse(data.danger);
						$('#td1').html(obj.area);
						$('#wheregu').html(obj.area);
						$('#td2').html(obj.level);
						$('#td3').html(obj.fail);
						
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
						<h2>지역별 검색</h2>
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
		
		<div id="myModal" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="mySignupModalLabel" aria-hidden="true">
		<div id="modal" class="modal-dialog modal-lg" >
			<div class="modal-content">
				<div class="modal-header">
					<!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
					<h4 id="myModalLabel">지역별 업종 분석 <strong id="wheregu"></strong></h4>
				</div>
				<div class="modal-body">
					<div id="salearea">
						<h4>업종별 매출액</h4>
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
								<tr id="tr1" class="tr">
									<td>분식집</td>
									<td id="a1"></td>
									<td id="b1"></td>
									<td id="c1"></td>
									<td id="d1"></td>
								</tr>
								<tr id="tr2" class="tr">
									<td>양식집</td>
									<td id="a2"></td>
									<td id="b2"></td>
									<td id="c2"></td>
									<td id="d2"></td>
								</tr>
								<tr id="tr3" class="tr">
									<td>일식</td>
									<td id="a3"></td>
									<td id="b3"></td>
									<td id="c3"></td>
									<td id="d3"></td>
								</tr>
								<tr id="tr4" class="tr">
									<td>제과점</td>
									<td id="a4"></td>
									<td id="b4"></td>
									<td id="c4"></td>
									<td id="d4"></td>
								</tr>
								<tr id="tr5" class="tr">
									<td>중국집</td>
									<td id="a5"></td>
									<td id="b5"></td>
									<td id="c5"></td>
									<td id="d5"></td>
								</tr>
								<tr id="tr6" class="tr">
									<td>치킨집</td>
									<td id="a6"></td>
									<td id="b6"></td>
									<td id="c6"></td>
									<td id="d6"></td>
								</tr>
								<tr id="tr7" class="tr">
									<td>커피</td>
									<td id="a7"></td>
									<td id="b7"></td>
									<td id="c7"></td>
									<td id="d7"></td>
								</tr>
								<tr id="tr8" class="tr">
									<td>패스트푸드</td>
									<td id="a8"></td>
									<td id="b8"></td>
									<td id="c8"></td>
									<td id="d8"></td>
								</tr>
								<tr id="tr9" class="tr">
									<td>한식</td>
									<td id="a9"></td>
									<td id="b9"></td>
									<td id="c9"></td>
									<td id="d9"></td>
								</tr>
								<tr id="tr10" class="tr">
									<td>호프집</td>
									<td id="a10"></td>
									<td id="b10"></td>
									<td id="c10"></td>
									<td id="d10"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="dangerarea">
						<h4>창업위험도</h4>
						<table id="table">
							<tr><td id="td1"></td><td id="td2"></td><td id="td3"></td></tr>
						</table>
						
						</div>
				</div>		
			</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					<!-- <div id="dangerarea">창업위험도</div> -->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="forpadding">
	<div class="container">
		<!-- <br>
		<h2>지역별 검색</h2>
		<br> -->
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강남구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강동구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강북구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">강서구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">관악구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">광진구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">구로구</button></td>
				</tr>
				<tr>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">금천구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">노원구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">도봉구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">동대문구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">동작구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">마포구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">서대문구</button></td>
				</tr>
				<tr>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">서초구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">성동구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">성북구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">송파구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">양천구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">영등포구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">용산구</button></td>
				</tr>
				<tr>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">은평구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">종로구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">도봉구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">중구</button></td>
					<td style="text-align: center;"><button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">중랑구</button></td>
							<td class="nonetd"></td>
							<td class="nonetd"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	<a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
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
