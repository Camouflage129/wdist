$(function() {
	$(".ui-dialog-titlebar-close").hide();
	$("button").click(function(){
		var btn = $(this).attr("id");
		var species = $(this).html();
		if(btn == "closeBtn" || btn == "closeBtn2")
			$("#foodModal").dialog("close");
		else {
			$.ajax({
				type : 'POST',
				url : 'foodAreaTitle.do',
				dataType : 'json',
				data : {
					"foodtitle" : species
				},
				success : function(data) {
					$("#foodModal").dialog();
				},
				error : function(data) {
					alert("통신실패 : " + data.message);
				}
			})
		}
	})
})