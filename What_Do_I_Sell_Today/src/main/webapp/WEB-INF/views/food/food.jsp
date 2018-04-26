<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
  
  <!-- table -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
  <!-- modal -->
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	table,tr,td{
  		text-align:center;
  		
  	}
  	
  	button{
  	background: none;
    color: inherit;
    border: none;
    padding: 0;
    font: inherit;
    cursor: pointer;
    outline: inherit;
  	}
  	
  	h2{
    text-align: center;
  	}
  	
  	.table.table-bordered{
  		width:80%;
  		margin-left: auto;
  		margin-right: auto;
  		table-layout: fixed;
  	}
  	
  .btn.btn-primary{
  	background: none;
    color: inherit;
    border: none;
    padding: 0;
    font: inherit;
    cursor: pointer;
    outline: inherit;
  	} 
  	
 	 a:link {text-decoration: none;}
	 a:visited {text-decoration: none;}
 	 a:hover {text-decoration: none;}
 	 
 	.card-header{
 		text-align: center;
 	}
  	
  	#accordion{
  		width:40%;
  		/* margin-left: auto; */
  		/* margin-right: auto; */
  		/* hieght:200px; */
  		 float: left;  	
  	}
  	
  	#result{
  		float: left; 
  		width:400px;
  		/*height:200px; */
  		padding-left: 30px;
  	}
</style>

<script type="text/javascript">
$(function(){
	
	var id;
	var idname;
	var classname;
	var title;
	var area;
	var result;
	var foodtitle;
	
	
	$('#h2title').hide();
	
	 $('.foodTitle').click(function(){
		 
		 foodtitle = $(this).children().text();
		 alert(foodtitle);
		 
		 $.ajax({
			type : 'POST',
			url : 'foodAreaTitle.do',
			dataType : 'json',
			data : {
				"foodtitle" : foodtitle
			},
			success : function(data) {
			alert("ajax success");
		  	area = data;
		  	var length = $('#areaTitle').find('td').length;
		  	
		  	$('#h2title').show();
		  	
		  	if(length==5){
		  		return;
		  	}else{
		  		for(var i in area){			
					   $('#araTitle').append('<td><button type="button" class="btn btn-primary"'+ 
							   ' data-toggle="modal" data-target="#myModal">'+area[i]+'</button></td>');
		 				}
		  		} 
		  	
			},
			error : function(data) {
				alert("통신실패 : " + data.message);
			}
		}); //end ajax     
		 
	 });
	 
	 $(document).on("click",".btn.btn-primary",function(){
		
		 	$.ajax({
		 		type : 'POST',
				url : 'areaDesc.do',
				dataType : 'json',
				data : {
					 "area" : $(this).text() 
				},  
				success : function(data) {
					alert("ajax success");
			  		result = data;
			  		$(".modal-body").html(result);
				},
				error : function(data) {
					alert("통신실패 : " + data.message);
				}
		 	
		 	});
	 });
});
</script>
</head>
<body>

<div class="container">
<br>
  <h2>키워드 분석</h2>
  <br>
  <!-- Button to Open the Modal -->
   <!-- <button id="button" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button> -->
  
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
	
        <table class="table table-bordered">
        	 <tbody>
     		 	<tr class="title1">	  	
        		  <td class="foodTitle"><button id="b1">한식</button></td>
				  <td class="foodTitle"><button>일식</button></td>
				  <td class="foodTitle"><button>분식</button></td>
				  <td class="foodTitle"><button>치킨</button></td>
				  <td class="foodTitle"><button>호프</button></td>
      			</tr>
      			<tr>
      			  <td class="foodTitle"><button>중식</button></td>
				  <td class="foodTitle"><button>양식</button></td>
				  <td class="foodTitle"><button>패스트푸드</button></td>
				  <td class="foodTitle"><button>제과</button></td>
				  <td class="foodTitle"><button>커피</button></td>
      			</tr>
    		</tbody>
    	</table>
    	
 <div id="area">
 <h2 id="h2title">키워드 지역분석</h2>
 <br>
  	<table class="table table-bordered">
  		<tbody>
  			<tr id="araTitle">
  			
  			</tr>
  		</tbody>
  	</table>
  </div>
       
    
</body>
</html>
