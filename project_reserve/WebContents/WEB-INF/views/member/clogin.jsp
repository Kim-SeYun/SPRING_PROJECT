<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h2>기업 로그인</h2>
	</div>
	<ul class="nav nav-tabs nav-justified mt-3" role="tablist" style="width:312px; margin:0 auto;">
		<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" style="color:black;" href="${contextPath}/member/login">고객 로그인</a></li>
		<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" style="color:black;" href="${contextPath}/member/clogin">사업자 로그인</a></li>
	</ul>
	
	<form action="${contextPath}/member/clogin" method="post">
		<div class="form-group">
			<label>아이디: </label>
			<!-- 로그인 실패시 아이디 기억-->
			<input type="text" name="username" class="form-control" value="${loginId}">
		</div>
		<div class="form-group">
			<label>비밀번호 : </label>
			<input type="text" name="password" class="form-control">
		</div>
		
		<!-- 로그인 실패시 보일 메세지  -->
		<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger">
			<strong>${errorMessage}</strong>
		</div>
		</c:if>
		로그인 상태 유지 : <input type="checkbox" name="remember-me"><br>
		<button class="btn btn-primary">로그인</button><br>
		<!-- csrf 토큰 -->
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
</div>

<%@ include file="../layout/footer.jsp" %>