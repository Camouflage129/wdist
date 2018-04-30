$(function() {
	/*var total_time = 5000;
	var current_time = 0;
	var refresh_interval = 50;
	var timer;*/
	$(".ui-dialog-titlebar-close").hide();
	$("button").click(function() {
		var btn = $(this).attr("id");
		var species = $(this).html();
		if (btn == "closeBtn" || btn == "closeBtn2")
			$("#foodModal").hide();else {
			$.ajax({
				type : 'POST',
				url : 'foodAreaTitle.do',
				dataType : 'json',
				data : {
					"foodtitle" : species
				},
				success : function(data) {
					var list = data.list;
					
					var a = '';
					a += '<img alt="wordcloud" src="/image/' + data.wordcloud + '.jpeg">';
					$('#wordcloudImg').html(a);
					$("#myModal").modal();
				},
				error : function(data) {
					alert("통신실패 : " + data.message);
				}
			})
		}
	})
	function refresh_bar() {
		$("#progressbar").progressbar({
			value : current_time
		});
		current_time += refresh_interval;
		if (current_time > total_time) clearInterval(timer);
	}
})