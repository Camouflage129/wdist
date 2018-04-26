<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
						a += '<div class="commentInfo' + value.replyNum + '">' + '댓글번호 : ' + value.replyNum + ' / 작성자 : ' + value.usersID;
						if('${userid}' == value.usersID) {
							a += '<a onclick="commentUpdate(' + value.replyNum + ',\'' + value.contents + '\');"> 수정 </a>';
							a += '<a onclick="commentDelete(' + value.replyNum + ');"> 삭제 </a>';
						}
						a += '</div> <div class="commentContent' + value.replyNum + '"> <p> 내용 : ' + value.contents + '</p>';
						a += '</div></div>';
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
