<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	var boardNum = '${board.boardNum}'; //게시글 번호

	$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		commentInsert(insertData); //Insert 함수호출(아래)
	});

	//댓글 목록 
	function commentList() {
		alert("list test");
		$.getJSON('/replyList/'+boardNum, function(data) {
			alert("데이터야 어딨니");
			var a = '';
			$.each(data, function(key, value) {
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += '<div class="commentInfo' + value.boardNum + '">' + '댓글번호 : ' + value.boardNum + ' / 작성자 : ' + value.usersID;
				a += '<a onclick="commentUpdate(' + value.boardNum + ',\'' + value.contents + '\');"> 수정 </a>';
				a += '<a onclick="commentDelete(' + value.boardNum + ');"> 삭제 </a> </div>';
				a += '<div class="commentContent' + value.boardNum + '"> <p> 내용 : ' + value.contents + '</p>';
				a += '</div></div>';
			});
			$(".commentList").html(a);
		});
	}

	//댓글 등록
	function commentInsert(insertData) {
		$("#submitBtn").on("click", function() {
			$.ajax({
				type : 'post',
				url : '/insertReply',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					boardNum : $("#").val(),
					usersID : $("#").val(),
					contents : $("#").val()
				}),
				success : function(result) {
					if (result == 'Success') {
						commentList(); //댓글 작성 후 댓글 목록 reload
						$('[name=content]').val('');
					}
				}
			});
		});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(boardNum, contents) {
		var a = '';

		a += '<div class="input-group">';
		a += '<input type="text" class="form-control" name="content_' + boardNum + '" value="' + contents + '"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc(' + boardNum + ');">수정</button> </span>';
		a += '</div>';

		$('.commentContent' + boardNum).html(a);

	}

	//댓글 수정
	function commentUpdateProc(boardNum) {
		var updateContent = $('[name=content_' + boardNum + ']').val();
		$.ajax({
			type : 'put',
			url : '/updateReply/' + replyNum,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				contents : $("#").val()
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'Success') {
					commentList(boardNum);
				}
			}
		});
	}

	//댓글 삭제 
	function commentDelete(replyNum) {
		$.ajax({
			type : 'delete',
			url : '/deleteReply/' + replyNum,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result:" + result);
				if (result == 'Success') {
					commentList(boardNum);
				}
			}
		});
	}

	$(document).ready(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 
	});
</script>
