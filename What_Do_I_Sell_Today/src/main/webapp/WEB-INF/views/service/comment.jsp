<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<script>
	var boardNum = '${board.boardNum}'; //게시글 번호
	$("#commentInsertBtn").click(function() { //댓글 등록 버튼 클릭시 
		$.ajax({
			type : 'POST',
			url : '/insertReply',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				boardNum : ${board.boardNum},
				contents : $("#content").val()
			}),
			dataType : 'text',
			success : function(result) {
				if (result == 'Success') {
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=content]').val('');
				}
			}
		});
	});

	//댓글 목록 
	function commentList() {
		$.ajax({
			type : 'GET',
			url : '/replyList/'+boardNum,
			success : function(result) {
				if(result != "") {
					var a = '';
					$.each(result, function(key, value) {
						if(value.parentNum!=0){
						a += '<div style="float:left;height:20px;width:20px;margin-top: 3px;margin-left: 5px;"><i class="fas fa-angle-double-right"></i></div>'
						}
						a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
						a += '<div class="commentInfo' + value.replyNum + '">' + '작성자 : ' + value.usersID;
						a += '<div style="float:right;">'
						if(value.parentNum==0){
						a += '<button type="button" class="btn btn-primary btn-xs" onclick="commentReInsertForm(' + value.replyNum + ');"> 답글</button>';
						}
						if('${userid}' == value.usersID) {
							a += '<button type="button" class="btn btn-default btn-xs" onclick="commentUpdate(' + value.replyNum + ',\'' + value.contents + '\');"> 수정 </button>';
							a += '<button type="button" class="btn btn-danger btn-xs" onclick="commentDelete(' + value.replyNum + ');"> 삭제 </button>';
						}
						a += '</div></div> <div class="commentContent' + value.replyNum + '"> <p> 내용 : ' + value.contents + '</p>';
						a += '</div><div class="recome'+value.replyNum+'" id="recom'+value.replyNum+'"></div></div>';
					});
					$(".commentList").html(a);
				}
			}
		});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(replyNum, contents) {
		var a = '';

		a += '<div class="input-group">';
		a += '<input id='+replyNum+'contents type="text" class="form-control" name="content_' + replyNum + '" value="' + contents + '"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc(' + replyNum + ');">수정</button> </span>';
		a += '</div>';

		$('.commentContent' + replyNum).html(a);

	}
	
	//대댓글 입력폼
	function commentReInsertForm(replyNum) {
		var a = '';

		a += '<div class="input-group">';
		a += '<input id=recom'+replyNum+'contents type="text" class="form-control" name="recontent_' + replyNum + '" />';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentReInsert(' + replyNum + ');">등록</button> </span>';
		a += '</div>';

		$('.recome' + replyNum).html(a);
	}
	//대댓글 등록
	function commentReInsert(replyNum) {
		var updateContent = $('[name=recontent_' + replyNum + ']').val();
		alert('요청받음 : '+updateContent+' 글번호'+replyNum);
		$.ajax({
			type : 'POST',
			url : '/insertReReply',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				parentNum : replyNum,
				boardNum : ${board.boardNum},
				contents : updateContent
			}),
			dataType : 'text',
			success : function(result) {
				if (result == 'Success') {
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=content]').val('');
				}
			},
			 error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }

				
		});
	}


	//댓글 수정
	function commentUpdateProc(replyNum) {
		var updateContent = $('[name=content_' + replyNum + ']').val();
		$.ajax({
			type : 'PUT',
			url : '/updateReply/' + replyNum,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				contents : $("#"+replyNum+"contents").val()
			}),
			dataType : 'text',
			success : function(result) {
				if (result == 'Success') {
					commentList();
				}
			}
		});
	}

	//댓글 삭제 
	function commentDelete(replyNum) {
		var execute = confirm("정말 삭제하시겠습니까?");
		if(execute) {
			$.ajax({
				type : 'delete',
				url : '/deleteReply/' + replyNum,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'Success') {
						commentList();
					}
				}
			});
		}
	}

	$(document).ready(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 
	});
</script>
