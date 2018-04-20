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
	  	var id;
		var idname;
		var classname;
		var title;
		var area;
		
	  $(".button").click(function (){
		  $("#divToggle").toggle(); 
		  
		  id = $(this).attr('id'); 
			 idname = '#'+id;
			 classname = "."+id;
			 
			/*  alert(id);
			 alert($(id).text()); */
			 
			 //alert("ajax");
			 $.ajax({
				type : 'POST',
				url : 'foodAreaTitle.do',
				dataType : 'json',
				data : {
					"foodtitle" : $(idname).text()
				},
				success : function(data) {
			  	area = data;
			  	var length = $("#tr").find('td').length;
			  	
			  	if(length==5){
			  		return;
			  	}else{
			  		for(var i in area){			
						   $(classname).append('<td><a href="/areaDesc.do?area='+area[i]+'\">'+area[i]+'</a></td>');
			 				}
			  		} 
			  	
				},
				error : function(data) {
					alert("통신실패 : " + data.message);
				}
			}); //end ajax     
		  }); 
	
	  
	  
	  
	  $('tr').has('td').has('a').css('cursor', 'pointer');
	  
  });
 
    </script>
    
    <script type="text/javascript">
$(function(){
	var id;
	var idname;
	var classname;
	var title;
	var food;
	
	 $('.button').click(function(){
		 id = $(this).attr('id'); 
		 idname = '#'+id;
		 classname = "."+id;
		 
		/*  alert(id);
		 alert($(id).text()); */
		 
		 //alert("ajax");
		 $.ajax({
			type : 'POST',
			url : 'areaFoodTitle.do',
			dataType : 'json',
			data : {
				"areatitle" : $(idname).text()
			},
			success : function(data) {
		  	food = data;
		  	var length = $("#foodtitle").find('td').length;
		  	
		  	if(length==5){
		  		return;
		  	}else{
		  		for(var i in food){			
					   $("#foodtitle").append('<td><a href="/menuDesc.do?food='+food[i]+'\">'+food[i]+'</a></td>');
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
        <td><a id="area1" class="button">강남구</a></td>
        <td><a id="area2" class="button">강동구</a></td>
        <td><a id="area3" class="button">강북구</a></td>
        <td><a id="area4" class="button">강서구</a></td>
        <td><a id="area5" class="button">관악구</a></td>
        <td><a id="area6" class="button">광진구</a></td>
        <td><a id="area7" class="button">구로구</a></td>
      </tr>
      <tr>
        <td><a id="area8" class="button">금천구</a></td>
        <td><a id="area9" class="button">노원구</a></td>
        <td><a id="area10" class="button">도봉구</a></td>
        <td><a id="area11" class="button">동대문구</a></td>
        <td><a id="area12" class="button">동작구</a></td>
        <td><a id="area13" class="button">마포구</a></td>
        <td><a id="area14" class="button">서대문구</a></td>
      </tr>
      <tr>
        <td><a id="area15" class="button">서초구</a></td>
        <td><a id="area16" class="button">성동구</a></td>
        <td><a id="area17" class="button">성북구</a></td>
        <td><a id="area18" class="button">송파구</a></td>
        <td><a id="area19" class="button">양천구</a></td>
        <td><a id="area20" class="button">영등포구</a></td>
        <td><a id="area21" class="button">용산구</a></td>
      </tr>
      <tr>
        <td><a id="area22" class="button">은평구</a></td>
        <td><a id="area23" class="button">종로구</a></td>
        <td><a id="area24" class="button">도봉구</a></td>
        <td><a id="area25" class="button">중구</a></td>
        <td><a id="area26" class="button">중랑구</a></td>
      </tr>
    </tbody>
  </table>
</div>


<div id="divToggle" style="display: none;">

<table class="table table-bordered">
    <tbody>
      <tr id="foodtitle">
      <!--   <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">한식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">일식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">중식</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">카페</a></td>
        <td><a href="index.jsp?content=WEB-INF/views/area/menu_desc.jsp">양식</a></td> -->
      </tr>
      </tbody>
</table>
</div>

</body>
</html>
