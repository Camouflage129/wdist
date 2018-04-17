<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="js/freeBoard.js"></script>
	<title>자유 게시판</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
						<tr class="table-primary">
							<th scope="row">번호</th>
							<!-- EL태그로 그냥 번호 셀 것 -->
							<td><a href="findBoard.do?num=${board.BoardNum}">${board.Title}</a></td>
							<td>${board.Contents}</td>
							<td>${board.UsersID}</td>
							<td>${board.PostDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form action="searchBoard.do" method="post">
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3">
							<select id="searchTitle" class="custom-select">
							    <option value="Title">제목</option>
							    <option value="Contents">내용</option>
							    <option value="UserID">작성자</option>
						    </select>
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control" placeholder="게시글 검색" id="searchBoard">
						</div>
						<div class="col-sm-3">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-3">
			<button id="insertBoard" type="button" class="btn btn-info">글쓰기</button>
		</div>
		</div>
	</div>
</body>
</html>