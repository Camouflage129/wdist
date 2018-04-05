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
<html>
<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>
	
</style>

</head>
<body>

<div class="container">
  <h2>업종별 검색</h2>
  <br>
  <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
          한식
        </a>
      </div>
      <div id="collapseOne" class="collapse show" data-parent="#accordion">
        <div class="card-body">
        <p><a href="index.jsp?content=WEB-INF/views/food/area_desc.jsp">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
        일식
      </a>
      </div>
      <div id="collapseTwo" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
          분식
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
   
 <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
          치킨
        </a>
      </div>
      <div id="collapseFour" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseFive">
          호프
        </a>
      </div>
      <div id="collapseFive" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseSix">
          중식
        </a>
      </div>
      <div id="collapseSix" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseSeven">
          양식
        </a>
      </div>
      <div id="collapseSeven" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>

 <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseEight">
          패스트푸드
        </a>
      </div>
      <div id="collapseEight" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>

<div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseNine">
          제과
        </a>
      </div>
      <div id="collapseNine" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTen">
          커피
        </a>
      </div>
      <div id="collapseTen" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <p><a href="#">1.강남</a></p>
        <p><a href="#">2.마포</a></p>
        <p><a href="#">3.강서</a></p>
        <p><a href="#">4.강북</a></p>
        <p><a href="#">5.노원</a></p>
        </div>
      </div>
    </div>

  </div>
</div>
    
</body>
</html>
