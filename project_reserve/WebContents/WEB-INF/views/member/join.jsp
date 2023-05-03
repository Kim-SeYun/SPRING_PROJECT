<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
.input_errors{
	font-size: 16px;
	font-weight: bold;
	color: red;
}
.error_on{
	border-color: red;
}
</style>

<div class="container">
	<div class="jumbotron">
		<h1>회원 가입</h1>
	</div>
	<form action="${contextPath}/member/join" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<spring:hasBindErrors name="memberDTO"/> <!-- name속성 : 커맨드객체 이름 -->
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" class="form-control" id="name" name="name" value="${memberDTO.name}">
			<form:errors path="memberDTO.name" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="memberId">아이디</label>
			<input type="text" class="form-control" id="memberId" name="memberId" value="${memberDTO.memberId}">
			<form:errors path="memberDTO.memberId" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="text" class="form-control" id="password" name="password" value="${memberDTO.password}">
			<form:errors path="memberDTO.password" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="confirmPassword">비밀번호확인</label>
			<input type="text" class="form-control" id="confirmPassword" name="confirmPassword" value="${memberDTO.confirmPassword}">
			<form:errors path="memberDTO.confirmPassword" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" class="form-control" id="email" name="email" value="${memberDTO.email}">
			<form:errors path="memberDTO.email" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="phoneNumber">휴대폰번호</label>
			<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${memberDTO.phoneNumber}" placeholder="하이픈'-'없이 입력">
			<form:errors path="memberDTO.phoneNumber" element="div" class="input_errors" />
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<input type="text" name="address" class="form-control" placeholder="주소">
		</div>
		<div class="form-group">
			<label for="birth">생년월일</label>
			<input type="text" name="birth" class="form-control" placeholder="생년월일">
		</div>
		<button class="btn btn-primary">회원가입</button>
	</form>	
</div>

<%@ include file="../layout/footer.jsp" %>


<script>
$(function(){
	let error_form = $('.input_errors');
	console.log(error_form.length);
	if(error_form.length>0){
		error_form.prev().addClass('error_on')
	}
})
</script>