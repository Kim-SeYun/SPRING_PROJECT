<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	<h1>공지사항 글쓰기</h1>
	<form action="${contextPath}/board/write" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		<input type="text" name="title" placeholder="제목" class="form-control">
		<textarea rows="10"name="content" placeholder="내용" class="form-control"></textarea>
		<input type="text" name="writer" placeholder="작성자" class="form-control" value="관리자" readonly>
		<button class="btn btn-info">등록</button>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>