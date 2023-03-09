<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	<h1>이벤트</h1>
	<!--  -->
	<form action="${contextPath}/event/write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> -->
		<input type="text" name="title" class="form-control" placeholder="제목">
		<textarea rows="10" name="content" class="form-control"></textarea>
		<div class="fileForm">
			<div>
				<button type="button" class="btn btn-primary add">폼추가</button>
				<button type="button" class="btn btn-danger del">폼삭제</button>
			</div>
			<input type="file" name="attachFile" class="form-control attachFile">
		</div>
		<button class="btn btn-info">등록</button>
	</form>
	
</div>

<%@ include file="../layout/footer.jsp" %>