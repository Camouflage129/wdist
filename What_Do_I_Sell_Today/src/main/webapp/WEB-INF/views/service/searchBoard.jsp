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
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="count" value="${postnum + 1}"/>
					<c:forEach var="board" items="${list}">
						<c:set var="count" value="${count - 1}"/>
						<tr class="table-primary">
							<th scope="row">${count}</th>
							<td><a href="findBoard.do?num=${board.boardNum}">${board.title}</a></td>
							<td>${board.usersID}</td>
							<td>${board.postDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div id="center">
					<ul class="pagination pagination-sm">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="${pageNum}" step="1">
							<li class="page-item"><a class="page-link" href="searchBoard.do?num=${i}&Type=${type}&searchTitle=${searchTitle}&text=${text}">${i}</a></li>
						</c:forEach>
						<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form action="searchBoard.do" method="post">
					<input type="hidden" name="num" value="1">
					<input id="type" type="hidden" name="Type" value="${type}">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<select id="searchTitle" name="searchTitle" class="custom-select">
								    <option value="Title">제목</option>
								    <option value="Contents">내용</option>
								    <option value="UsersID">작성자</option>
							    </select>
							</div>
							<div class="col-sm-6">
								<input type="text" name="text" class="form-control" placeholder="게시글 검색" id="searchBoard">
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