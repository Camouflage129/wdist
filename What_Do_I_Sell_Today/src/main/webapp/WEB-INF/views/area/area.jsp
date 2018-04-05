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
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 -->  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
  	
 	 a:link {text-decoration: none;}
	 a:visited {text-decoration: none;}
 	 a:hover {text-decoration: none;}
  	
  </style>
</head>
<body>

<div class="container">
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders on all sides of the table and the cells:</p>            
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
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">강남구</a></td>
        <td>강동구</td>
        <td>강북구</td>
        <td>강서구</td>
        <td>관악구</td>
        <td>광진구</td>
        <td>구로구</td>
      </tr>
      <tr>
        <td>금천구</td>
        <td>노원구</td>
        <td>도봉구</td>
        <td>동대문구</td>
        <td>동작구</td>
        <td>마포구</td>
        <td>서대문구</td>
      </tr>
      <tr>
        <td>서초구</td>
        <td>성동구</td>
        <td>성북구</td>
        <td>송파구</td>
        <td>양천구</td>
        <td>영등포구</td>
        <td>용산구</td>
      </tr>
      <tr>
        <td>은평구</td>
        <td>종로구</td>
        <td>중구</td>
        <td>중랑구</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
