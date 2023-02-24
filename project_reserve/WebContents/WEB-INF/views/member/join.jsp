<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>회원 가입</h1>
	</div>
	<form action="${contextPath}/member/join" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<input type="text" name="memberId" class="form-control" placeholder="아이디">
		</div>
		<div class="form-group">
			<input type="text" name="password" class="form-control" placeholder="비밀번호">
		</div>
		<div class="form-group">
			<input type="text" name="confirmPassword" class="form-control" placeholder="비밀번호확인">
		</div>
		<div class="form-group">
			<input type="text" name="name" class="form-control" placeholder="이름">
		</div>
		<div class="form-group">
			<input type="text" name="birth" class="form-control" placeholder="생년월일">
		</div>
		<div class="form-group">
			<input type="text" name="address" class="form-control" placeholder="주소">
		</div>
		<div class="form-group">
			<input type="text" name="email" class="form-control" placeholder="이메일">
		</div>
		<button class="btn btn-primary">가입하기</button>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>