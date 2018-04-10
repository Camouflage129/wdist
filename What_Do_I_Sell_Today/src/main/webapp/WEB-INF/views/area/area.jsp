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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <style>
  	table,tr,td{
  		text-align:center;
  	}
  	table td a{
  	display:block;
  	width:100%;
  	height:100%;
  	}
  	
 	 a:link {
 	 	text-decoration: none;
 	 	
 	 }
	 a:visited {
	 	text-decoration: none;
	 }
 	 a:hover {
 	 	text-decoration: none;
 	 	  
 	 }
  	
  </style>
  
  <script type="text/javascript">
  $(function (){
	  $(".button").click(function (){
		  $("#divToggle").toggle(); 
		  }); 
	  
	  $('tr').has('td').has('a').css('cursor', 'pointer');
	  });
 
    </script>
</head>
<body>

<div class="container">
  <h2>지역별 검색</h2>
  <br>
  <table class="table table-bordered">
   <!--  <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead> -->
    <tbody>
      <tr>
        <td><a class="button">강남구</a></td>
        <td><a class="button">강동구</a></td>
        <td><a class="button">강북구</a></td>
        <td><a class="button">강서구</a></td>
        <td><a class="button">관악구</a></td>
        <td><a class="button">광진구</a></td>
        <td><a class="button">구로구</a></td>
      </tr>
      <tr>
        <td><a class="button">금천구</a></td>
        <td><a class="button">노원구</a></td>
        <td><a class="button">도봉구</a></td>
        <td><a class="button">동대문구</a></td>
        <td><a class="button">동작구</a></td>
        <td><a class="button">마포구</a></td>
        <td><a class="button">서대문구</a></td>
      </tr>
      <tr>
        <td><a class="button">서초구</a></td>
        <td><a class="button">성동구</a></td>
        <td><a class="button">성북구</a></td>
        <td><a class="button">송파구</a></td>
        <td><a class="button">양천구</a></td>
        <td><a class="button">영등포구</a></td>
        <td><a class="button">용산구</a></td>
      </tr>
      <tr>
        <td><a class="button">은평구</a></td>
        <td><a class="button">종로구</a></td>
        <td><a class="button">도봉구</a></td>
        <td><a class="button">중구</a></td>
        <td><a class="button">중랑구</a></td>
      </tr>
    </tbody>
  </table>
</div>


<div id="divToggle" style="display: none;">

<table class="table table-bordered">
    <tbody>
      <tr>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">한식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">일식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">중식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">카페</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">양식</a></td>
      </tr>
      </tbody>
</table>
</div>

</body>
</html>
