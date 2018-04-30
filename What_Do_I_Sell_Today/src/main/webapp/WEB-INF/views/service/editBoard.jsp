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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="js/insertBoard.js"></script>

<title>Insert Board</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<form id="editForm" action="editBoard.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>글수정</legend>
				<input id="type" type="hidden" name="Type" value="${type}">
				<input id="type" type="hidden" name="num" value="${num}">
				
				<div class="form-group">
					제목 : <input type="text" name="Title" class="form-control" id="inputDefault" value="${board.title }">
				</div>
				<div class="form-group">
					작성자 : <input type="text" name="UsersID" class="form-control" id="inputDefault" value="${userid}" readonly="readonly">
				</div>
				<form>
					<textarea name="Contents" id="editor1" rows="10" cols="80">
		                	${board.contents}
		            </textarea>
					<script>
		                CKEDITOR.replace( 'editor1' );
		            </script>
				</form>
				<div class="form-group"  style = "padding: 15px;">
					<button id="cancel" type="button" class="btn btn-danger float-lg-right">취소</button>
					<button id="submit" type="submit" class="btn btn-info float-lg-right">수정하기</button>
				</div>
			</fieldset>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
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
	<script src="js/freeBoard.js"></script>
	
	<!-- Template Custom JavaScript File -->
	<script src="js/custom.js"></script>
</body>
</html>