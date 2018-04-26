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
<style>
	table,tr,td{
  		text-align:center;
  	}
  	
  	/* table td a{
  	display:block;
  	width:100%;
  	height:100%;
  	} */
  	
  	/* table td button{
  	display:block;
  	width:100%;
  	height:100%;
  	} 
  	 */
  	
  	button{
  	/* display:block;
  	width:100%;
  	height:100%; */
  	
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
	 alert("start");
	
	var id;
	var idname;
	var classname;
	var title;
	var area;
	var result;
	
	/*  $('tr').has('td').has('a').css('cursor', 'pointer');  */
	 
	 $('.card-link').click(function(){
		 alert("click");
		 id = $(this).attr('id'); 
		 idname = '#'+id;
		 classname = "."+id;
		 
		 $.ajax({
			type : 'POST',
			url : 'foodAreaTitle.do',
			dataType : 'json',
			data : {
				"foodtitle" : $(idname).text()
			},
			success : function(data) {
		  	area = data;
		  	var length = $(classname).find('td').length;
		  	
		  	if(length==5){
		  		return;
		  	}else{
		  		for(var i in area){			
					   /* $(classname).append('<td><a id="areadesc" href="/areaDesc.do?area='+area[i]+'\">'+area[i]+'</a></td>'); */
					   /* $(classname).append('<td><a class="areadesc">'+area[i]+'</a></td>'); */
					   $(classname).append('<td><button class="areadesc">'+area[i]+'</button></td>');
		 				}
		  		} 
		  	
			},
			error : function(data) {
				alert("통신실패 : " + data.message);
			}
		}); //end ajax     
		 
	 });
	 
	 
	 $(document).on("click",".areadesc",function(){
		
		 	$.ajax({
		 		type : 'POST',
				url : 'areaDesc.do',
				dataType : 'json',
				data : {
					 "area" : $(this).text() 
				},  
				success : function(data) {
					alert("success");
			  		result = data;
			  		$("#resultcontent").html(result);
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
  
  <div id="accordion">
  <br>
  <h3>업종별 검색</h3>
  <br>
      <div class="card">
      <div class="card-header">
       <!--  <a id="title1" class="collapsed card-link" data-toggle="collapse" href="#collapseOne"> -->
        <a id="title1" class="card-link" data-toggle="collapse" href="#collapseOne">한식</a>
      </div>
      <div id="collapseOne" class="collapse" data-parent="#accordion">
        <div class="card-body">
         <table class="table table-bordered">
        	 <tbody>
     		 	<tr class="title1">	  	
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    
    <div class="card">
      <div class="card-header">
        <a id="title2" class="card-link" data-toggle="collapse" href="#collapseTwo">일식</a>
      </div>
      <div id="collapseTwo" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title2">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a id="title3" class="card-link" data-toggle="collapse" href="#collapseThree">분식</a>
      </div>
      <div id="collapseThree" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title3">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
   
 <div class="card">
      <div class="card-header">
        <a id="title4" class="card-link" data-toggle="collapse" href="#collapseFour">치킨</a>
      </div>
      <div id="collapseFour" class="collapse" data-parent="#accordion">
        <div class="card-body">
       <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title4">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a id="title5" class="card-link" data-toggle="collapse" href="#collapseFive">호프</a>
      </div>
      <div id="collapseFive" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title5">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a id="title6" class="card-link" data-toggle="collapse" href="#collapseSix">중식</a>
      </div>
      <div id="collapseSix" class="collapse" data-parent="#accordion">
        <div class="card-body">
       <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title6">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    
     <div class="card">
      <div class="card-header">
        <a id="title7" class="card-link" data-toggle="collapse" href="#collapseSeven">양식</a>
      </div>
      <div id="collapseSeven" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title7">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>

 <div class="card">
      <div class="card-header">
        <a id="title8" class="card-link" data-toggle="collapse" href="#collapseEight">패스트푸드</a>
      </div>
      <div id="collapseEight" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title8">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>

<div class="card">
      <div class="card-header">
        <a id="title9" class="card-link" data-toggle="collapse" href="#collapseNine">제과</a>
      </div>
      <div id="collapseNine" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title9">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
    
    <div class="card">
      <div class="card-header">
        <a id="title10" class="card-link" data-toggle="collapse" href="#collapseTen">커피</a>
      </div>
      <div id="collapseTen" class="collapse" data-parent="#accordion">
        <div class="card-body">
        <table class="table table-bordered">
        	<tbody>
     		 	<tr class="title10">
        			
      			</tr>
    		</tbody>
    	</table>
        </div>
      </div>
    </div>
  </div>
  
 <div id="result">
 <br>
	<h3>업종 분석 결과</h3>
	<br>
	<div id="resultcontent">
	
	</div>
</div>

</div>
    
</body>



</html>
